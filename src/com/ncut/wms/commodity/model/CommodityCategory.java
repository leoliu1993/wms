package com.ncut.wms.commodity.model;

import javax.persistence.*;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.GenericGenerator;

@Entity
@DynamicInsert(true)
@DynamicUpdate(true)
public class CommodityCategory {

	private Integer commodityCategoryId;
	private Integer pid;
	private String commodityCategoryName;

	@Id
	public Integer getCommodityCategoryId() {
		return commodityCategoryId;
	}

	public Integer getPid() {
		return pid;
	}

	public String getCommodityCategoryName() {
		return commodityCategoryName;
	}

	public void setCommodityCategoryId(Integer commodityCategoryId) {
		this.commodityCategoryId = commodityCategoryId;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public void setCommodityCategoryName(String commodityCategoryName) {
		this.commodityCategoryName = commodityCategoryName;
	}
	
	@Override
	public String toString() {
		return "CommodityCategory [commodityCategoryId=" + commodityCategoryId
				+ ", pid=" + pid + ", commodityCategoryName="
				+ commodityCategoryName + "]";
	}

	
}
