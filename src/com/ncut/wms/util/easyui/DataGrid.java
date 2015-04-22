package com.ncut.wms.util.easyui;

import java.util.ArrayList;
import java.util.List;

public class DataGrid<T> {

	private int totals = 0;
	private List<T> rows = new ArrayList<T>();

	public int getTotals() {
		return totals;
	}

	public void setTotals(int totals) {
		this.totals = totals;
	}

	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}


}
