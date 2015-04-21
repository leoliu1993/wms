package com.ncut.wms.unit.action;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.ncut.wms.commodity.model.Commodity;
import com.ncut.wms.commodity.service.CommodityService;
import com.ncut.wms.unit.model.Unit;
import com.ncut.wms.unit.service.UnitService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller("unitAction")
@Scope("prototype")
public class UnitAction extends ActionSupport implements
ModelDriven<Unit> {

	private UnitService unitService;
	private Unit unit = new Unit();
	
	/**
	 * 跳转计量单位管理页面
	 * 
	 * @return
	 */
	public String managementPage() {

		return "managementPage";
	}
	
	@Override
	public Unit getModel() {
		return unit;
	}

	public void setUnit(Unit unit) {
		this.unit = unit;
	}
	
	@Resource
	public void setUnitService(UnitService unitService) {
		this.unitService = unitService;
	}

}
