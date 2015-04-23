package com.ncut.wms.purchase.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.ncut.wms.purchase.dao.PurchaseDAO;
import com.ncut.wms.purchase.dao.PurchasegoodsDAO;
import com.ncut.wms.purchase.dto.PurchaseDTO;
import com.ncut.wms.purchase.model.Purchase;
import com.ncut.wms.util.easyui.DataGrid;

@Service("PurchaseService")
public class PurchaseService {

	/* ======以下业务逻辑======== */
	
	public DataGrid<PurchaseDTO> datagrid(PurchaseDTO pDTO) {
		DataGrid<PurchaseDTO> dg = new DataGrid<PurchaseDTO>();
		Map<String,Object> map = new HashMap<String,Object>();
		String hql = "from Supplier supplier";
		
		/*if(pDTO.getSupplierName()!=null && !"".equals(pDTO.getSupplierName().trim())){
			hql+=" where supplier.supplierName like :supplierName";
			map.put("supplierName", "%"+pDTO.getSupplierName().trim()+"%");
		}*/
		
		String totalHql = "select count(*) "+hql;
		//实现排序
		if(pDTO.getSort()!=null){
			hql+=" order by "+pDTO.getSort()+" "+pDTO.getOrder();
		}
		List<Purchase> ps = pDAO.list(hql, map, pDTO.getPage(), pDTO.getRows());
		List<PurchaseDTO> pDTOs = new ArrayList<PurchaseDTO>();
		for(Purchase p:ps){
			PurchaseDTO purchaseDTO = new PurchaseDTO();
			BeanUtils.copyProperties(p, purchaseDTO);
			
			//插入一些需要的数据
			
			
			
			pDTOs.add(purchaseDTO);
		}
		dg.setTotals(pDAO.count(totalHql, map));
		dg.setRows(pDTOs);
		return dg;
	}

	/* ======以下声明======== */
	private PurchaseDAO pDAO;
	private PurchasegoodsDAO pgDAO;

	@Resource
	public void setpDAO(PurchaseDAO pDAO) {
		this.pDAO = pDAO;
	}

	@Resource
	public void setPgDAO(PurchasegoodsDAO pgDAO) {
		this.pgDAO = pgDAO;
	}
}
