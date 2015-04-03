package com.ncut.wms.commodity.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.ncut.wms.commodity.dao.CommodityDAO;
import com.ncut.wms.commodity.model.Commodity;

@Component("commodityService")
public class CommodityService {

	private CommodityDAO commodityDAO;

	public int total() {
		int total = commodityDAO.count();
		return total;
	}

	public List<Commodity> getCommodityListByPage(int currentPage, int pageSize) {
		List<Commodity> commodityList = commodityDAO.findByPagination(
				currentPage, pageSize);
		return commodityList;
	}

	public List<Commodity> getCommodityList() {
		List<Commodity> commodityList = commodityDAO.findAll();
		return commodityList;
	}

	public CommodityDAO getCommodityDAO() {
		return commodityDAO;
	}

	@Resource
	public void setCommodityDAO(CommodityDAO commodityDAO) {
		this.commodityDAO = commodityDAO;
	}
}
