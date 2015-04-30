package com.ncut.wms.stock.dao;

import org.springframework.stereotype.Repository;

import com.ncut.wms.base.dao.impl.BaseDAOImpl;
import com.ncut.wms.stock.model.InStock;

@Repository("inStockDAO")
public class InStockDAO extends BaseDAOImpl<InStock> {

}
