package com.ncut.wms.commodity.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.ncut.wms.commodity.dao.CommodityDAO;
import com.ncut.wms.commodity.dto.CommodityDTO;
import com.ncut.wms.commodity.model.Commodity;
import com.ncut.wms.unit.dao.UnitDAO;
import com.ncut.wms.unit.model.Unit;

@Service("commodityService")
public class CommodityService {

	private CommodityDAO commodityDAO;
	private UnitDAO unitDAO;

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
	 * @param currentPage 当前页
	 * @param pageSize 页面显示数据数量
	 * @return
	 */
	public String getCommodityListJsonByPage(int currentPage, int pageSize) {
		List<Commodity> commodityList = commodityDAO.findByPagination(
				currentPage, pageSize);
		// 拼Jason字符串 {"total":total , "rows":[{},{}]}
		
		String commodityListStr = "{\"total\":" + this.total() + " , \"rows\":"
				+ JSONArray.fromObject(commodityList).toString() + "}";
		return commodityListStr;
	}
	
	/**
	 * 查询商品列表的json字符串
	 * @param currentPage 当前页
	 * @param pageSize 页面显示数据数量
	 * @param searchWords 搜索关键词
	 * @return
	 */
	public String getCommodityListJsonByPage(int currentPage, int pageSize, Map<String, Object> searchWords) {
		List<Commodity> commodityList = commodityDAO.findByPagination(
				currentPage, pageSize, searchWords);
		//将每个商品信息中的商品类别和单位进行转义
		List<CommodityDTO> cDTOList = new ArrayList<CommodityDTO>();
		for(Commodity c : commodityList) {
			
			CommodityDTO cDTO = new CommodityDTO();
			//CommodityDTO cDTO = Model2DTO(c);
			BeanUtils.copyProperties(c, cDTO);
			
			Unit unit = unitDAO.findById(c.getCommodityUnit());
			if(unit != null) {
				cDTO.setCommodityUnitName(unit.getUnitName());
			}
			
			cDTOList.add(cDTO);
			
		}
		
		// 拼Jason字符串 {"total":total , "rows":[{},{}]}
		String commodityListStr = "{\"total\":" + this.total() + " , \"rows\":"
				+ JSONArray.fromObject(cDTOList).toString() + "}";
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
		commodityDAO.save(commodity);
		//System.out.println("cc" + commodity.getCommodityCategory().toString());
	}

	public void update(Commodity commodity) {
		commodityDAO.update(commodity);
		
	}
	
	public void delete(Commodity commodity) {
		commodityDAO.delete(commodity);
	}
	
	public void delete(Integer id) {
		commodityDAO.delete(id);
	}

	public CommodityDAO getCommodityDAO() {
		return commodityDAO;
	}

	@Resource
	public void setCommodityDAO(CommodityDAO commodityDAO) {
		this.commodityDAO = commodityDAO;
	}
	
	@Resource
	public void setUnitDAO(UnitDAO unitDAO) {
		this.unitDAO = unitDAO;
	}

}
