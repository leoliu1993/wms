package com.ncut.wms.stock.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class InStockRemain {
	
	Integer inStockRemainId;
	Integer inStockgoodsId;
	Integer remain;

	@Id
	@GeneratedValue
	public Integer getInStockRemainId() {
		return inStockRemainId;
	}

	public void setInStockRemainId(Integer inStockRemainId) {
		this.inStockRemainId = inStockRemainId;
	}

	public Integer getInStockgoodsId() {
		return inStockgoodsId;
	}

	public void setInStockgoodsId(Integer inStockgoodsId) {
		this.inStockgoodsId = inStockgoodsId;
	}

	public Integer getRemain() {
		return remain;
	}

	public void setRemain(Integer remain) {
		this.remain = remain;
	}

}
