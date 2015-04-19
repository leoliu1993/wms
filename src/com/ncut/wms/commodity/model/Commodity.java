package com.ncut.wms.commodity.model;

import javax.persistence.*;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.context.annotation.Lazy;

import com.ncut.wms.unit.model.Unit;

@Entity
@DynamicInsert(true)
@DynamicUpdate(true)
public class Commodity {

	private Integer commodityId;
	private String commodityNum;
	private String commodityName;
	private String commodityBar;
	private String commodityType;
	private Integer commodityCategoryId;
	private Integer CommodityUnit;
	private String remark;

	@Id
	@GeneratedValue
	public Integer getCommodityId() {
		return commodityId;
	}

	public void setCommodityId(Integer commodityId) {
		this.commodityId = commodityId;
	}

	public String getCommodityNum() {
		return commodityNum;
	}

	public void setCommodityNum(String commodityNum) {
		this.commodityNum = commodityNum;
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

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Override
	public String toString() {
		return "Commodity [commodityId=" + commodityId + ", commodityNum="
				+ commodityNum + ", commodityName=" + commodityName
				+ ", commodityBar=" + commodityBar + ", commodityType="
				+ commodityType + ", commodityCategoryId="
				+ commodityCategoryId + ", CommodityUnit=" + CommodityUnit
				+ ", remark=" + remark + "]";
	}

}
