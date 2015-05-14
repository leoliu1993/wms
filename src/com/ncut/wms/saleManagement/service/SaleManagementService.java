package com.ncut.wms.saleManagement.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.ncut.wms.client.dao.impl.ClientDAO;
import com.ncut.wms.client.model.Client;
import com.ncut.wms.commodity.dao.CommodityCategoryDAO;
import com.ncut.wms.commodity.dao.CommodityDAO;
import com.ncut.wms.commodity.model.Commodity;
import com.ncut.wms.commodity.model.CommodityCategory;
import com.ncut.wms.saleManagement.dao.SaleDetailDAO;
import com.ncut.wms.saleManagement.dao.SaleDetailSourceDAO;
import com.ncut.wms.saleManagement.dao.SaleTotalDAO;
import com.ncut.wms.saleManagement.dto.SaleManagementDTO;
import com.ncut.wms.saleManagement.model.SaleDetail;
import com.ncut.wms.saleManagement.model.SaleDetailSource;
import com.ncut.wms.saleManagement.model.SaleTotal;
import com.ncut.wms.stock.dao.InStockgoodsDAO;
import com.ncut.wms.stock.dao.ShelfRemainDAO;
import com.ncut.wms.stock.dao.StockDAO;
import com.ncut.wms.stock.dao.TotalStockDAO;
import com.ncut.wms.stock.model.InStockgoods;
import com.ncut.wms.stock.model.ShelfRemain;
import com.ncut.wms.stock.model.Stock;
import com.ncut.wms.stock.model.TotalStock;
import com.ncut.wms.unit.dao.UnitDAO;
import com.ncut.wms.unit.model.Unit;
import com.ncut.wms.util.system.Tools;



@Service("saleManagementService")
public class SaleManagementService {

	/* ======以下业务逻辑======== */
	public SaleManagementDTO getCommodityAndStock(SaleManagementDTO smDTO) {

		Commodity commodity = commodityDAO.load(smDTO.getCommodityId());
		CommodityCategory cc = ccDAO.load(commodity.getCategoryId());
		Unit unit = unitDAO.load(commodity.getUnitId());
		TotalStock ts = tsDAO.findByCommodityId(commodity.getCommodityId());
		Client client = clientDAO.load(smDTO.getClientId());

		BeanUtils.copyProperties(commodity, smDTO);
		BeanUtils.copyProperties(ts, smDTO);

		// 设定对应客户级别的售价
		if (client.getLevel() == 0) {
			smDTO.setPrice(commodity.getSalePrice());
		}
		if (client.getLevel() == 1) {
			smDTO.setPrice(commodity.getVip1Price());
		}
		if (client.getLevel() == 2) {
			smDTO.setPrice(commodity.getVip2Price());
		}
		if (client.getLevel() == 3) {
			smDTO.setPrice(commodity.getVip3Price());
		}

		// 设置类别
		smDTO.setCategoryName(cc.getCname());
		// 设置计量单位
		smDTO.setUnitName(unit.getUnitName());

		return smDTO;
	}

	public String getSaleCode(String date) {
		String head = "XSDD";
		String code = date.replaceAll("-", "");
		String hql = "select max(st.stId) from SaleTotal as st where st.createDate between '"
				+ date + " 00:00:00' and '" + date + " 23:59:59'";
		List<SaleTotal> list = stDAO.list(hql);
		Object obj = list.get(0);
		if (obj != null)
			return head + code + Tools.formatCode(obj.toString());
		return head + code + "0001";
	}
	
	public void saveSale(SaleManagementDTO smDTO) {
		
		//对总单进行赋值
		SaleTotal st = new SaleTotal();
		BeanUtils.copyProperties(smDTO, st);
		st.setStId(smDTO.getOrderId());
		
		//对详单进行赋值
		JSONArray jArr = JSONArray.fromObject(smDTO.getDetailOrder());
		List<SaleDetail> sdList = new ArrayList<SaleDetail>();
		//格式化前台数据
		for(int i=0; i<jArr.size(); i++) {
			
			JSONObject jObj = JSONObject.fromObject(jArr.get(i));
			
			SaleDetail sd = new SaleDetail();
			//对商品详单赋值
			sd.setStId(jObj.getString("orderId"));
			sd.setCommodityId(jObj.getInt("commodityId"));
			if(jObj.getString("price") == null || "".equals(jObj.getString("price"))) {
				sd.setPrice(0.0);
			} else {
				sd.setPrice(jObj.getDouble("price"));
			}
			if(jObj.getString("amount") == null || "".equals(jObj.getString("amount"))) {
				sd.setAmount(0);
			} else {
				sd.setAmount(jObj.getInt("amount"));
			}
			sd.setReturnedAmount(0);
			sd.setTotalPrice(jObj.getDouble("totalPrice"));
			sdList.add(sd);
		}
		
		//对总单和详单进行存储
		stDAO.add(st);
		for(SaleDetail sd : sdList) {
			sdDAO.add(sd);
			
			//中间表进行修改
			//在入库详单中把有该商品的行找出来，然后找中间表对应的行
			//根据订单中的数量减少中间表的可见剩余量
			//将该数据变化存储到销售来源表
			List<InStockgoods> igList = igDAO.findByCommodity(sd.getCommodityId());
			Integer needAmount = sd.getAmount();
			for(InStockgoods ig : igList) {
				ShelfRemain sr = srDAO.findByOrderIdAndDetailId(ig.getInStockId(), ig.getInStockgoodsId());
				Integer visibleRemain = sr.getVisibleRemain();
				SaleDetailSource sds = new SaleDetailSource();
				
				//该货架的商品量大于等于需求量则直接减少剩余量跳出
				//小于则减掉该货架的全部剩余量，并标识need量下次循环继续操作
				if(visibleRemain >= needAmount) {
					visibleRemain -= needAmount;
					//修改中间表商品剩余量
					sr.setVisibleRemain(visibleRemain);
					
					//添加来源表的商品来源
					sds.setStId(st.getStId());
					sds.setSdId(sd.getSdId());
					sds.setOrderId(sr.getOrderId());
					sds.setDetailId(sr.getDetailId());
					sds.setAmount(needAmount);
					
					srDAO.update(sr);
					sdsDAO.add(sds);
					
					//库存详单进行修改
					Stock stock = stockDAO.findByCommodityAndStorage(ig.getCommodityId(), ig.getStorageId());
					Integer visibleStock = stock.getVisibleStock() - needAmount;
					stock.setVisibleStock(visibleStock);
					stockDAO.update(stock);
					break;
				} else {
					needAmount -= visibleRemain;
					
					//修改中间表商品剩余量
					sr.setVisibleRemain(0);
					
					//添加来源表的商品来源
					sds.setStId(st.getStId());
					sds.setSdId(sd.getSdId());
					sds.setOrderId(sr.getOrderId());
					sds.setDetailId(sr.getDetailId());
					sds.setAmount(visibleRemain);
					
					srDAO.update(sr);
					sdsDAO.add(sds);
					
					//库存详单进行修改
					Stock stock = stockDAO.findByCommodityAndStorage(ig.getCommodityId(), ig.getStorageId());
					Integer visibleStock = stock.getVisibleStock() - visibleRemain;
					stock.setVisibleStock(visibleStock);
					stockDAO.update(stock);
				}
				
			}
			
			//库存总单进行修改
			TotalStock ts = tsDAO.findByCommodityId(sd.getCommodityId());
			Integer visibleStock = ts.getVisibleStock() - sd.getAmount();
			ts.setVisibleStock(visibleStock);
			tsDAO.update(ts);
			
		}
		
	}

	/* ======以下声明======== */
	private SaleTotalDAO stDAO;
	private SaleDetailDAO sdDAO;
	private SaleDetailSourceDAO sdsDAO;
	
	private CommodityDAO commodityDAO;
	private CommodityCategoryDAO ccDAO;
	private UnitDAO unitDAO;
	private ClientDAO clientDAO;
	
	private ShelfRemainDAO srDAO;
	private TotalStockDAO tsDAO;
	private StockDAO stockDAO;
	private InStockgoodsDAO igDAO;

	@Resource
	public void setCommodityDAO(CommodityDAO cDAO) {
		this.commodityDAO = cDAO;
	}

	@Resource
	public void setTsDAO(TotalStockDAO tsDAO) {
		this.tsDAO = tsDAO;
	}

	@Resource
	public void setClientDAO(ClientDAO clientDAO) {
		this.clientDAO = clientDAO;
	}

	@Resource
	public void setCcDAO(CommodityCategoryDAO ccDAO) {
		this.ccDAO = ccDAO;
	}

	@Resource
	public void setUnitDAO(UnitDAO unitDAO) {
		this.unitDAO = unitDAO;
	}

	@Resource
	public void setStDAO(SaleTotalDAO stDAO) {
		this.stDAO = stDAO;
	}

	@Resource
	public void setSdDAO(SaleDetailDAO sdDAO) {
		this.sdDAO = sdDAO;
	}

	@Resource
	public void setSrDAO(ShelfRemainDAO srDAO) {
		this.srDAO = srDAO;
	}

	@Resource
	public void setStockDAO(StockDAO stockDAO) {
		this.stockDAO = stockDAO;
	}

	@Resource
	public void setIgDAO(InStockgoodsDAO igDAO) {
		this.igDAO = igDAO;
	}

	@Resource
	public void setSdsDAO(SaleDetailSourceDAO sdsDAO) {
		this.sdsDAO = sdsDAO;
	}


}
