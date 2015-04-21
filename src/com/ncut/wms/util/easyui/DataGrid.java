package com.ncut.wms.util.easyui;

import java.util.ArrayList;
import java.util.List;

public class DataGrid<T> {

	private Long totals = 0L;
	private List<T> rows = new ArrayList<T>();

	public Long getTotals() {
		return totals;
	}

	public void setTotals(Long totals) {
		this.totals = totals;
	}

	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}


}
