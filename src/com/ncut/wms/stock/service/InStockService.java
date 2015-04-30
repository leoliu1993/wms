package com.ncut.wms.stock.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.ncut.wms.purchase.dao.PurchaseDAO;
import com.ncut.wms.purchase.dao.PurchasegoodsDAO;
import com.ncut.wms.purchase.model.Purchase;
import com.ncut.wms.purchase.model.Purchasegoods;
import com.ncut.wms.stock.dao.InStockDAO;
import com.ncut.wms.stock.dao.InStockgoodsDAO;
import com.ncut.wms.stock.dao.StockDAO;
import com.ncut.wms.stock.dto.InStockDTO;
import com.ncut.wms.stock.model.InStock;
import com.ncut.wms.stock.model.InStockgoods;
import com.ncut.wms.util.system.Tools;

@Service("inStockService")
public class InStockService {

	/* ======以下业务逻辑======== */
	public String getOrderCode(String date) {
		String head = "CKJH";
		String code = date.replaceAll("-", "");
		String hql = "select max(t.inStockId) from InStock as t where t.createDate between '"+date+" 00:00:00' and '"+date+" 23:59:59'";
		List<Purchase> list = pDAO.list(hql);
		Object obj = list.get(0);
		if(obj!=null)
			return head+code+Tools.formatCode(obj.toString());
		return head+code+"0001";
	}
	
	public void savePurchase(InStockDTO iDTO) {
		
		//对入库总单进行赋值
		String purchaseId = iDTO.getIds();
		Purchase purchase = pDAO.findById(purchaseId);
		InStock inStock = new InStock();
		BeanUtils.copyProperties(purchase, inStock);
		//获得订单号并赋值
		String date = iDTO.getCreateDate().substring(0, 10);
		String inStockId = this.getOrderCode(date);
		inStock.setInStockId(inStockId);
		inStock.setCreateDate(iDTO.getCreateDate());
		
		//对进货总单内的入库状态进行修改
		purchase.setStockState(1);
		
		//对入库详单进行赋值
		List<Purchasegoods> pgList = pgDAO.list("from Purchasegoods pg where pg.purchaseId = " + purchaseId);
		List<InStockgoods> igList = new ArrayList<InStockgoods>();
		for(Purchasegoods pg : pgList) {
			InStockgoods ig = new InStockgoods();
			BeanUtils.copyProperties(pg, ig);
			ig.setInStockId(inStockId);
			igList.add(ig);
		}
		
		//对总单和详单进行存储
		iDAO.add(inStock);
		for(InStockgoods ig : igList) {
			igDAO.add(ig);
		}
		//进货总单的库存状态进行修改存储
		pDAO.update(purchase);
		
		//对库存信息进行修改:首先搜索商品编号，如果有则修改改库存量，如果没有则添加该库存信息。同时注意实际库存量应该为入库数量减去退货数量
		
	}
	
	/* ======以下声明======== */
	private InStockDAO iDAO;
	private InStockgoodsDAO igDAO;
	private PurchaseDAO pDAO;
	private PurchasegoodsDAO pgDAO;
	private StockDAO sDAO;
	
	@Resource
	public void setiDAO(InStockDAO iDAO) {
		this.iDAO = iDAO;
	}
	
	@Resource
	public void setIgDAO(InStockgoodsDAO igDAO) {
		this.igDAO = igDAO;
	}

	@Resource
	public void setpDAO(PurchaseDAO pDAO) {
		this.pDAO = pDAO;
	}

	@Resource
	public void setPgDAO(PurchasegoodsDAO pgDAO) {
		this.pgDAO = pgDAO;
	}

	@Resource
	public void setsDAO(StockDAO sDAO) {
		this.sDAO = sDAO;
	}
}
