package com.ncut.wms.unit.service;

import java.util.*;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.ncut.wms.unit.dao.UnitDAO;
import com.ncut.wms.unit.model.Unit;

@Service("unitService")
public class UnitService {
	
	private UnitDAO unitDAO;

	public String getUnitList() {
		return null;
	}
	
	public String getUnitListJson() {

		List<Unit> unitList = unitDAO.findAll();
		
		//向下拉菜单中添加一个默认项
		Unit unitDefault = new Unit();
		unitDefault.setUnitId(0);
		unitDefault.setUnitName("空");
		unitList.add(0, unitDefault);
		
		String unitListStr = JSONArray.fromObject(unitList).toString();
		return unitListStr;
	}
	
	public Long total() {
		return unitDAO.count("from Unit");
	}

	public UnitDAO getUnitDAO() {
		return unitDAO;
	}

	@Resource
	public void setUnitDAO(UnitDAO unitDAO) {
		this.unitDAO = unitDAO;
	}
}
