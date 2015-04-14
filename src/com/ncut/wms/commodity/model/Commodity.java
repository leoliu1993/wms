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

	private String commodityId;
	private String commodityName;
	private String commodityBar;
	private String commodityType;
	private CommodityCategory commodityCategory;
	private Unit commodityUnit;
	private String remark;

	@Id
	public String getCommodityId() {
		return commodityId;
	}

	public String getCommodityName() {
		return commodityName;
	}

	public String getCommodityBar() {
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
	@JoinColumn(name="commodityUnit")
	public Unit getCommodityUnit() {
		return commodityUnit;
	}

	public String getRemark() {
		return remark;
	}

	public void setCommodityId(String commodityId) {
		this.commodityId = commodityId;
	}

	public void setCommodityName(String commodityName) {
		this.commodityName = commodityName;
	}

	public void setCommodityBar(String commodityBar) {
		this.commodityBar = commodityBar;
	}

	public void setCommodityType(String commodityType) {
		this.commodityType = commodityType;
	}

	public void setCommodityCategory(CommodityCategory commodityCategory) {
		this.commodityCategory = commodityCategory;
	}

	public void setCommodityUnit(Unit unit) {
		this.commodityUnit = unit;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Override
	public String toString() {
		return "Commodity [commodityId=" + commodityId + ", commodityName="
				+ commodityName + ", commodityBar=" + commodityBar
				+ ", commodityType=" + commodityType + ", commodityCategory="
				+ commodityCategory.getCommodityCategoryName()
				+ ", commodityUnit=" + commodityUnit.getUnitName()
				+ ", remark=" + remark + "]";
	}
}
