package com.ncut.wms.stock.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.ncut.wms.commodity.dao.CommodityDAO;
import com.ncut.wms.purchase.dto.PurchasegoodsDTO;
import com.ncut.wms.purchase.model.Purchasegoods;
import com.ncut.wms.stock.dao.InStockDAO;
import com.ncut.wms.stock.dao.InStockgoodsDAO;
import com.ncut.wms.stock.dto.InStockDTO;
import com.ncut.wms.stock.dto.InStockgoodsDTO;
import com.ncut.wms.stock.model.InStockgoods;
import com.ncut.wms.util.easyui.DataGrid;

@Service("inStockgoodsService")
public class InStockgoodsService {
	
	/* ======以下业务逻辑======== */
	public DataGrid<InStockgoodsDTO> datagrid(InStockDTO iDTO) {
		DataGrid<InStockgoodsDTO> dg = new DataGrid<InStockgoodsDTO>();
		Map<String,Object> map = new HashMap<String,Object>();
		String hql = "from InStockgoods ig";
		if(iDTO.getInStockId()!=null && !"".equals(iDTO.getInStockId().trim())){
			hql+=" where ig.inStockId = :inStockId";
			map.put("inStockId", iDTO.getInStockId().trim());
		}
		String totalHql = "select count(*) "+hql;
		//实现排序
		if(iDTO.getSort()!=null){
			hql+=" order by "+iDTO.getSort()+" "+iDTO.getOrder();
		}
		List<InStockgoods> igList = igDAO.list(hql, map, iDTO.getPage(), iDTO.getRows());
		List<InStockgoodsDTO> igDTOList = new ArrayList<InStockgoodsDTO>();
		for(InStockgoods ig:igList){
			InStockgoodsDTO igoodsDTO = new InStockgoodsDTO();
			BeanUtils.copyProperties(ig, igoodsDTO);
			
			//插入一些需要的数据
			igoodsDTO.setCommodityName(cDAO.load(igoodsDTO.getCommodityId()).getCommodityName());
			
			igDTOList.add(igoodsDTO);
		}
		dg.setTotal(igDAO.count(totalHql, map));
		dg.setRows(igDTOList);
		return dg;
	}
	
	/* ======以下声明======== */
	private InStockDAO iDAO;
	private InStockgoodsDAO igDAO;
	private CommodityDAO cDAO;
	
	@Resource
	public void setiDAO(InStockDAO iDAO) {
		this.iDAO = iDAO;
	}
	
	@Resource
	public void setIgDAO(InStockgoodsDAO igDAO) {
		this.igDAO = igDAO;
	}

	@Resource
	public void setcDAO(CommodityDAO cDAO) {
		this.cDAO = cDAO;
	}
	
	
}
