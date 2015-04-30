package com.ncut.wms.stock.dao;

import org.springframework.stereotype.Repository;

import com.ncut.wms.base.dao.impl.BaseDAOImpl;
import com.ncut.wms.stock.model.Stock;

@Repository("stockDAO")
public class StockDAO extends BaseDAOImpl<Stock> {

}
