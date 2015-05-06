package com.ncut.wms.stock.dto;

public class InStockRemainDTO {

	Integer inStockRemainId;
	String inStockgoodsId;
	Integer remain;

	/* =====datagrid属性====== */
	private int page;
	private int rows;
	private String order;
	private String sort;
	private String ids;

	public Integer getInStockRemainId() {
		return inStockRemainId;
	}

	public void setInStockRemainId(Integer inStockRemainId) {
		this.inStockRemainId = inStockRemainId;
	}

	public String getInStockgoodsId() {
		return inStockgoodsId;
	}

	public void setInStockgoodsId(String inStockgoodsId) {
		this.inStockgoodsId = inStockgoodsId;
	}

	public Integer getRemain() {
		return remain;
	}

	public void setRemain(Integer remain) {
		this.remain = remain;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

}
