package com.ncut.wms.sale.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ncut.wms.sale.dao.SaleDAO;
import com.ncut.wms.sale.dao.SalegoodsDAO;
import com.ncut.wms.util.system.Tools;

@Service("saleService")
public class SaleService {

	public String getOrderCode(String date) {
		String head = "XSCK";
		String code = date.replaceAll("-", "");
		String hql = "select max(t.saleId) from Sale as t where t.createDate between '"+date+" 00:00:00' and '"+date+" 23:59:59'";
		List list = sDAO.list(hql);
		Object obj = list.get(0);
		if(obj!=null)
			return head+code+Tools.formatCode(obj.toString());
		return head+code+"0001";
	}

	/* ======以下声明======== */
	private SaleDAO sDAO;
	private SalegoodsDAO sgDAO;

	@Resource
	public void setsDAO(SaleDAO sDAO) {
		this.sDAO = sDAO;
	}

	@Resource
	public void setSgDAO(SalegoodsDAO sgDAO) {
		this.sgDAO = sgDAO;
	}

}
