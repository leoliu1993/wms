package com.ncut.wms.stockManagement.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.ncut.wms.commodity.dao.CommodityDAO;
import com.ncut.wms.saleManagement.dao.ReturnStockInDetailDAO;
import com.ncut.wms.saleManagement.dao.ReturnStockInTotalDAO;
import com.ncut.wms.saleManagement.model.ReturnStockInDetail;
import com.ncut.wms.stock.dao.ShelfRemainDAO;
import com.ncut.wms.stock.dao.StockDAO;
import com.ncut.wms.stock.dao.TotalStockDAO;
import com.ncut.wms.stock.model.ShelfRemain;
import com.ncut.wms.stock.model.Stock;
import com.ncut.wms.stock.model.TotalStock;
import com.ncut.wms.stockManagement.dao.BreakDetailDAO;
import com.ncut.wms.stockManagement.dao.BreakTotalDAO;
import com.ncut.wms.stockManagement.dto.StockManagementDTO;
import com.ncut.wms.stockManagement.model.BreakDetail;
import com.ncut.wms.stockManagement.model.BreakTotal;
import com.ncut.wms.util.easyui.DataGrid;
import com.ncut.wms.util.system.Tools;

@Service("stockManagementService")
public class StockManagementService {

	/* ======以下业务逻辑======== */
	public String getReportBreakCode(String date) {
		String head = "BSTH";
		String code = date.replaceAll("-", "");
		String hql = "select max(bt.btId) from BreakTotal as bt where bt.createDate between '"+date+" 00:00:00' and '"+date+" 23:59:59'";
		List<BreakTotal> list = btDAO.list(hql);
		Object obj = list.get(0);
		if(obj!=null)
			return head+code+Tools.formatCode(obj.toString());
		return head+code+"0001";
	}
	
	public void saveReportBreak(StockManagementDTO smDTO) {
		//对退货总单进行赋值
		BreakTotal bt = new BreakTotal();
		BeanUtils.copyProperties(smDTO, bt);
		bt.setRitId(smDTO.getOrderId());
		String date = smDTO.getCreateDate().substring(0, 10);
		String btId = this.getReportBreakCode(date);
		bt.setBtId(btId);
		
		//对退货详单进行赋值
		//对前台字符串进行转化
		JSONArray jArr = JSONArray.fromObject(smDTO.getDetailOrder());
		List<BreakDetail> bdList = new ArrayList<BreakDetail>();
		for(int i=0; i<jArr.size(); i++) {
			JSONObject jObj = JSONObject.fromObject(jArr.get(i));
			Integer returnedAmount = jObj.getInt("returnedAmount");
			if(returnedAmount != 0) {
				Integer ridId = jObj.getInt("detailId");
				Integer commodityId = jObj.getInt("commodityId");
				
				BreakDetail bd = new BreakDetail();
				bd.setBtId(btId);
				bd.setRidId(ridId);
				bd.setCommodityId(commodityId);
				bd.setReturnedAmount(returnedAmount);
				
				bdList.add(bd);
			}
		}
		
		//对总单和详单进行存储
		btDAO.add(bt);
		for(BreakDetail bd : bdList) {
			bdDAO.add(bd);
			
			//入库单的退货量进行修改
			ReturnStockInDetail rid = ridDAO.load(bd.getRidId());
			Integer returnedAmount = rid.getReturnedAmount() + bd.getReturnedAmount();
			rid.setReturnedAmount(returnedAmount);
			ridDAO.update(rid);
			
			//中间表的退货量进行修改
			ShelfRemain sr = srDAO.findByOrderIdAndDetailId(bt.getRitId(),bd.getRidId());
			Integer visibleStock = sr.getVisibleRemain() - bd.getReturnedAmount();
			sr.setVisibleRemain(visibleStock);
			srDAO.update(sr);
			
			//库存总单的退货量进行修改
			TotalStock ts = tsDAO.findByCommodityId(bd.getCommodityId());
			visibleStock = ts.getVisibleStock() - bd.getReturnedAmount();
			ts.setVisibleStock(visibleStock);
			tsDAO.update(ts);
			
			//库存详单的退货量进行修改
			Stock stock = stockDAO.findByCommodityAndStorage(rid.getCommodityId(), rid.getStorageId());
			visibleStock = stock.getVisibleStock() - bd.getReturnedAmount();
			stock.setVisibleStock(visibleStock);
			stockDAO.update(stock);
		}
	}
	
	public DataGrid<StockManagementDTO> getStockWarningTotalGrid(StockManagementDTO smDTO) {
		DataGrid<StockManagementDTO> dg = new DataGrid<StockManagementDTO>();
		Map<String,Object> map = new HashMap<String,Object>();
		String head = "select ts ";
		String hql = "from TotalStock ts, Commodity c where 1=1 and ts.commodityId = c.commodityId and ts.stockAmount < c.minimum";
		if(smDTO.getCommodityName()!=null && !"".equals(smDTO.getCommodityName().trim())){
			hql+=" and c.commodityName like :commodityName";
			map.put("commodityName", "%"+smDTO.getCommodityName().trim()+"%");
		}
		String totalHql = "select count(ts) "+hql;
		hql = head + hql;
		//实现排序
		if(smDTO.getSort()!=null){
			hql+=" order by "+smDTO.getSort()+" "+smDTO.getOrder();
		}
		List<TotalStock> tsList = tsDAO.list(hql, map, smDTO.getPage(), smDTO.getRows());
		List<StockManagementDTO> tsDTOList = new ArrayList<StockManagementDTO>();
		for(TotalStock ts:tsList){
			StockManagementDTO totalStockDTO = new StockManagementDTO();
			BeanUtils.copyProperties(ts, totalStockDTO);
			
			totalStockDTO.setCommodityName(commodityDAO.load(totalStockDTO.getCommodityId()).getCommodityName());
			
			tsDTOList.add(totalStockDTO);
		}
		dg.setTotal(tsDAO.count(totalHql, map));
		dg.setRows(tsDTOList);
		return dg;
	}

	/* ======以下声明======== */
	private BreakTotalDAO btDAO;
	private BreakDetailDAO bdDAO;
	
	private ReturnStockInTotalDAO ritDAO;
	private ReturnStockInDetailDAO ridDAO;
	
	private ShelfRemainDAO srDAO;
	private TotalStockDAO tsDAO;
	private StockDAO stockDAO;
	private CommodityDAO commodityDAO;

	@Resource
	public void setTsDAO(TotalStockDAO tsDAO) {
		this.tsDAO = tsDAO;
	}

	@Resource
	public void setCommodityDAO(CommodityDAO commodityDAO) {
		this.commodityDAO = commodityDAO;
	}

	@Resource
	public void setRitDAO(ReturnStockInTotalDAO rstDAO) {
		this.ritDAO = rstDAO;
	}

	@Resource
	public void setBtDAO(BreakTotalDAO btDAO) {
		this.btDAO = btDAO;
	}

	@Resource
	public void setBdDAO(BreakDetailDAO bdDAO) {
		this.bdDAO = bdDAO;
	}

	@Resource
	public void setRidDAO(ReturnStockInDetailDAO ridDAO) {
		this.ridDAO = ridDAO;
	}

	@Resource
	public void setSrDAO(ShelfRemainDAO srDAO) {
		this.srDAO = srDAO;
	}

	@Resource
	public void setStockDAO(StockDAO stockDAO) {
		this.stockDAO = stockDAO;
	}


}
