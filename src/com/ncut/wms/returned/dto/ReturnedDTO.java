package com.ncut.wms.returned.dto;

public class ReturnedDTO {
	
	private String orderId;
	private String createDate;
	private Double returnedPrice = 0.0;
	private Integer stockState = 0;
	private Integer userId;
	private String remark;
	
	private String detailOrder;

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public Double getReturnedPrice() {
		return returnedPrice;
	}

	public void setReturnedPrice(Double returnedPrice) {
		this.returnedPrice = returnedPrice;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getDetailOrder() {
		return detailOrder;
	}

	public void setDetailOrder(String detailGraid) {
		this.detailOrder = detailGraid;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public Integer getStockState() {
		return stockState;
	}

	public void setStockState(Integer stockState) {
		this.stockState = stockState;
	}
}
