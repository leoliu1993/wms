package com.ncut.wms.saleManagement.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.ncut.wms.base.dao.impl.BaseDAOImpl;
import com.ncut.wms.saleManagement.model.SaleDetailSource;



@Repository("saleDetailSourceDAO")
public class SaleDetailSourceDAO extends BaseDAOImpl<SaleDetailSource> {

	@SuppressWarnings("unchecked")
	public List<SaleDetailSource> findBySaleTotal(String stId) {
		String hql = "from SaleDetailSource sds where sds.stId = :stId";
		Query q = this.getSession().createQuery(hql).setParameter("stId", stId);
		return q.list();
	}

}
