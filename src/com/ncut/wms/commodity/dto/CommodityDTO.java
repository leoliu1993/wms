package com.ncut.wms.commodity.dto;

public class CommodityDTO {

	private Integer commodityId;
	private String commodityName;
	private Integer commodityBar;
	private String commodityType;
	private String commodityCategoryName;
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

	public Integer getCommodityBar() {
		return commodityBar;
	}

	public void setCommodityBar(Integer commodityBar) {
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

}
