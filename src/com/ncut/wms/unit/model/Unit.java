package com.ncut.wms.unit.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.ncut.wms.commodity.model.Commodity;

@Entity
@DynamicInsert(true)
@DynamicUpdate(true)
public class Unit {

	private String unit;
	private Commodity commodity;

	@Id
	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	@OneToOne(mappedBy="unit")
	public Commodity getCommodity() {
		return commodity;
	}

	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}

}
