package com.ncut.wms.commodity.dao;

import java.util.List;

import com.ncut.wms.commodity.model.Commodity;

public interface CommodityDAO {

	/**
	 * 查询所有商品列表
	 * @return 商品列表
	 */
	public List<Commodity> findAll();

	/**
	 * 分页查询商品列表
	 * @param currentPage 当前页
	 * @param pageSize 一页呈现数据数量
	 * @return 该页商品列表
	 */
	public List<Commodity> findByPagination(int currentPage, int pageSize);
	
	/**
	 * 获取商品总数
	 * @return 商品总数
	 */
	public int count();
}
