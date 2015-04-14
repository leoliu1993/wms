package com.ncut.wms.commodity.service;

import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.springframework.stereotype.Component;

import com.ncut.wms.commodity.dao.CommodityDAO;
import com.ncut.wms.commodity.model.Commodity;
import com.ncut.wms.commodity.model.CommodityCategory;
import com.ncut.wms.unit.model.Unit;
import com.ncut.wms.util.json.ObjectJsonValueProcessor;

@Component("commodityService")
public class CommodityService {

	private CommodityDAO commodityDAO;

	/**
	 * 计算商品总数
	 * @return
	 */
	public int total() {
		int total = commodityDAO.count();
		return total;
	}

	/**
	 * 根据分页获取商品列表
	 * @param currentPage 当前页
	 * @param pageSize 页面显示数据数量
	 * @return
	 */
	public List<Commodity> getCommodityListByPage(int currentPage, int pageSize) {
		List<Commodity> commodityList = commodityDAO.findByPagination(
				currentPage, pageSize);
		return commodityList;
	}
	
	/**
	 * 获得商品列表的json字符串
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public String getCommodityListJson(int currentPage, int pageSize) {
		List<Commodity> commodityList = commodityDAO.findByPagination(
				currentPage, pageSize);
		// 拼Jason字符串 {"total":total , "rows":[{},{}]}
		JsonConfig config = new JsonConfig();
		config.registerJsonValueProcessor(CommodityCategory.class,
				new ObjectJsonValueProcessor(
						new String[] { "commodityCategoryName" },
						CommodityCategory.class));
		config.registerJsonValueProcessor(Unit.class,
				new ObjectJsonValueProcessor(new String[] { "unitName" },
						Unit.class));
		String commodityListStr = "{\"total\":" + this.total() + " , \"rows\":"
				+ JSONArray.fromObject(commodityList, config).toString() + "}";
		return commodityListStr;
	}
	
	/**
	 * 获取所有商品列表
	 * @return
	 */
	public List<Commodity> getCommodityList() {
		List<Commodity> commodityList = commodityDAO.findAll();
		return commodityList;
	}

	public void add(Commodity commodity) {
		//commodityDAO.add(commodity);
		System.out.println(commodity.toString());
	}

	public CommodityDAO getCommodityDAO() {
		return commodityDAO;
	}

	@Resource
	public void setCommodityDAO(CommodityDAO commodityDAO) {
		this.commodityDAO = commodityDAO;
	}

}
