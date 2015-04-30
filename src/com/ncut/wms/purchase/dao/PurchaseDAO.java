package com.ncut.wms.purchase.dao;

import org.springframework.stereotype.Repository;

import com.ncut.wms.base.dao.impl.BaseDAOImpl;
import com.ncut.wms.purchase.model.Purchase;

@Repository("PurchseDAO")
public class PurchaseDAO extends BaseDAOImpl<Purchase> {

	public Purchase findById(String purchaseId) {

		return this.load(Integer.parseInt(purchaseId));
	}

}
