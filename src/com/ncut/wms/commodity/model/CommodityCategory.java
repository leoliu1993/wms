package com.ncut.wms.commodity.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

@Entity
@DynamicInsert(true)
@DynamicUpdate(true)
public class CommodityCategory {

	private Integer commodityCategoryId;
	private Integer pid;
	private String commodityCategoryName;
	private Commodity commodity;

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

	@OneToOne(mappedBy="commodityCategory")
	public Commodity getCommodity() {
		return commodity;
	}

	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}
}
