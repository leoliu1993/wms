package com.ncut.wms.unit.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.ncut.wms.base.dao.impl.BaseDAOImpl;
import com.ncut.wms.unit.dao.UnitDAO;
import com.ncut.wms.unit.model.Unit;

@Repository("unitDAO")
public class UnitDAO4MySqlImpl extends BaseDAOImpl<Unit> implements UnitDAO {
	
	@Override
	public List<Unit> findAll() {
		return this.list("from Unit");
	}
	
	@Override
	public Unit findById(Integer unitId) {
		return this.load(unitId);
	}

}
