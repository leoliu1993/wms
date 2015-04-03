package com.ncut.wms.commodity.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.ncut.wms.unit.model.Unit;

@Entity
@DynamicInsert(true)
@DynamicUpdate(true)
public class Commodity {

	private Integer commodityId;
	private String commodityName;
	private Integer commodityBar;
	private String commodityType;
	private CommodityCategory commodityCategory;
	private Unit unit;
	private String remark;

	@Id
	public Integer getCommodityId() {
		return commodityId;
	}

	public String getCommodityName() {
		return commodityName;
	}

	public Integer getCommodityBar() {
		return commodityBar;
	}

	public String getCommodityType() {
		return commodityType;
	}

	@OneToOne
	@JoinColumn(name="commodityCategoryId")
	public CommodityCategory getCommodityCategory() {
		return commodityCategory;
	}

	@OneToOne
	public Unit getUnit() {
		return unit;
	}

	public String getRemark() {
		return remark;
	}

	public void setCommodityId(Integer commodityId) {
		this.commodityId = commodityId;
	}

	public void setCommodityName(String commodityName) {
		this.commodityName = commodityName;
	}

	public void setCommodityBar(Integer commodityBar) {
		this.commodityBar = commodityBar;
	}

	public void setCommodityType(String commodityType) {
		this.commodityType = commodityType;
	}

	public void setCommodityCategory(CommodityCategory commodityCategory) {
		this.commodityCategory = commodityCategory;
	}

	public void setUnit(Unit unit) {
		this.unit = unit;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
}
