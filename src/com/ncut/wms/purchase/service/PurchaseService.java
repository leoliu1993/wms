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
import com.ncut.wms.supplier.dao.SupplierDAO;
import com.ncut.wms.supplier.dao.impl.SupplierDAOImpl;
import com.ncut.wms.supplier.model.Supplier;
import com.ncut.wms.user.dao.UserDAO;
import com.ncut.wms.user.dao.impl.UserDAO4MySqlImpl;
import com.ncut.wms.user.model.User;
import com.ncut.wms.util.easyui.DataGrid;
import com.ncut.wms.util.system.Tools;

@Service("PurchaseService")
public class PurchaseService {

	/* ======以下业务逻辑======== */
	
	/**
	 * 生成订单编号
	 * @param date 当前时间
	 * @return
	 */
	public String getOrderCode(String date) {
		String head = "JHDD";
		String code = date.replaceAll("-", "");
		String hql = "select max(t.purchaseId) from Purchase as t where t.createDate between '"+date+" 00:00:00' and '"+date+" 23:59:59'";
		List<Purchase> list = pDAO.list(hql);
		Object obj = list.get(0);
		if(obj!=null)
			return head+code+Tools.formatCode(obj.toString());
		return head+code+"0001";
	}
	
	public DataGrid<PurchaseDTO> datagrid(PurchaseDTO pDTO) {
		DataGrid<PurchaseDTO> dg = new DataGrid<PurchaseDTO>();
		Map<String,Object> map = new HashMap<String,Object>();
		String hql = "from Purchase p where 1=1 and p.stockState=0";
		
		if(pDTO.getBeginDate()!=null && !"".equals(pDTO.getBeginDate().trim())){
			hql+=" and p.createDate between :beginDate and :endDate";
			map.put("beginDate", pDTO.getBeginDate().trim());
			map.put("endDate", pDTO.getEndDate().trim());
		}
		
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
			Supplier s = sDAO.load(purchaseDTO.getSupplierId());
			purchaseDTO.setSupplierName(s.getSupplierName());
			
			User u = uDAO.load(purchaseDTO.getUserId());
			purchaseDTO.setUserName(u.getUsername());
			
			pDTOs.add(purchaseDTO);
		}
		dg.setTotal(pDAO.count(totalHql, map));
		dg.setRows(pDTOs);
		return dg;
	}
	
	public DataGrid<PurchaseDTO> querygrid(PurchaseDTO pDTO) {
		DataGrid<PurchaseDTO> dg = new DataGrid<PurchaseDTO>();
		Map<String,Object> map = new HashMap<String,Object>();
		String hql = "from Purchase p where 1=1";
		
		if(pDTO.getBeginDate()!=null && !"".equals(pDTO.getBeginDate().trim())){
			hql+=" and p.createDate between :beginDate and :endDate";
			map.put("beginDate", pDTO.getBeginDate().trim());
			map.put("endDate", pDTO.getEndDate().trim());
		}
		
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
			Supplier s = sDAO.load(purchaseDTO.getSupplierId());
			purchaseDTO.setSupplierName(s.getSupplierName());
			
			User u = uDAO.load(purchaseDTO.getUserId());
			purchaseDTO.setUserName(u.getUsername());
			
			pDTOs.add(purchaseDTO);
		}
		dg.setTotal(pDAO.count(totalHql, map));
		dg.setRows(pDTOs);
		return dg;
	}
	
	public void add(Purchase p) {
		pDAO.add(p);
		
	}

	/* ======以下声明======== */
	private PurchaseDAO pDAO;
	private PurchasegoodsDAO pgDAO;
	private SupplierDAO sDAO;
	private UserDAO uDAO;

	@Resource
	public void setpDAO(PurchaseDAO pDAO) {
		this.pDAO = pDAO;
	}

	@Resource
	public void setPgDAO(PurchasegoodsDAO pgDAO) {
		this.pgDAO = pgDAO;
	}

	@Resource
	public void setsDAO(SupplierDAO sDAO) {
		this.sDAO = sDAO;
	}

	@Resource
	public void setuDAO(UserDAO uDAO) {
		this.uDAO = uDAO;
	}

	
}
