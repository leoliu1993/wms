package com.ncut.wms.commodity.dto;

public class CommodityDTO {

	private Integer commodityId;
	private String commodityNum;
	private String commodityName;
	private String commodityBar;
	private String commodityType;
	private Integer commodityCategoryId;
	private String commodityCategoryName;
	private Integer CommodityUnit;
	private String commodityUnitName;
	private String remark;

	public Integer getCommodityId() {
		return commodityId;
	}

	public void setCommodityId(Integer commodityId) {
		this.commodityId = commodityId;
	}

	public String getCommodityName() {
		return commodityName;
	}

	public void setCommodityName(String commodityName) {
		this.commodityName = commodityName;
	}

	public String getCommodityBar() {
		return commodityBar;
	}

	public void setCommodityBar(String commodityBar) {
		this.commodityBar = commodityBar;
	}

	public String getCommodityType() {
		return commodityType;
	}

	public void setCommodityType(String commodityType) {
		this.commodityType = commodityType;
	}

	public String getCommodityCategoryName() {
		return commodityCategoryName;
	}

	public void setCommodityCategoryName(String commodityCategoryName) {
		this.commodityCategoryName = commodityCategoryName;
	}

	public String getCommodityUnitName() {
		return commodityUnitName;
	}

	public void setCommodityUnitName(String commodityUnitName) {
		this.commodityUnitName = commodityUnitName;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getCommodityNum() {
		return commodityNum;
	}

	public void setCommodityNum(String commodityNum) {
		this.commodityNum = commodityNum;
	}

	public Integer getCommodityCategoryId() {
		return commodityCategoryId;
	}

	public void setCommodityCategoryId(Integer commodityCategoryId) {
		this.commodityCategoryId = commodityCategoryId;
	}

	public Integer getCommodityUnit() {
		return CommodityUnit;
	}

	public void setCommodityUnit(Integer commodityUnit) {
		CommodityUnit = commodityUnit;
	}

}
