package com.ncut.wms.stock.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.ncut.wms.commodity.dao.CommodityDAO;
import com.ncut.wms.stock.dao.StockDAO;
import com.ncut.wms.stock.dto.StockDTO;
import com.ncut.wms.stock.model.Stock;
import com.ncut.wms.storage.dao.StorageDAO;
import com.ncut.wms.supplier.dto.SupplierDTO;
import com.ncut.wms.supplier.model.Supplier;
import com.ncut.wms.util.easyui.DataGrid;

@Service("stockService")
public class StockService {

	/* ======以下业务逻辑======== */
	public DataGrid<StockDTO> datagrid(StockDTO sDTO) {
		DataGrid<StockDTO> dg = new DataGrid<StockDTO>();
		Map<String,Object> map = new HashMap<String,Object>();
		String hql = "from Stock stock";
		if(sDTO.getCommodityName()!=null && !"".equals(sDTO.getCommodityName().trim())){
			hql+=" where stock.commodityName like :commodityName";
			map.put("commodityName", "%"+sDTO.getCommodityName().trim()+"%");
		}
		String totalHql = "select count(*) "+hql;
		//实现排序
		if(sDTO.getSort()!=null){
			hql+=" order by "+sDTO.getSort()+" "+sDTO.getOrder();
		}
		List<Stock> sList = sDAO.list(hql, map, sDTO.getPage(), sDTO.getRows());
		List<StockDTO> sDTOList = new ArrayList<StockDTO>();
		for(Stock s:sList){
			StockDTO stockDTO = new StockDTO();
			BeanUtils.copyProperties(s, stockDTO);
			
			stockDTO.setCommodityName(cDAO.load(stockDTO.getCommodityId()).getCommodityName());
			stockDTO.setStorageName(storageDAO.load(stockDTO.getStorageId()).getStorageName());
			
			sDTOList.add(stockDTO);
		}
		dg.setTotal(sDAO.count(totalHql, map));
		dg.setRows(sDTOList);
		return dg;
	}
	
	/* ======以下声明======== */
	private StockDAO sDAO;
	private CommodityDAO cDAO;
	private StorageDAO storageDAO;

	@Resource
	public void setsDAO(StockDAO sDAO) {
		this.sDAO = sDAO;
	}

	@Resource
	public void setcDAO(CommodityDAO cDAO) {
		this.cDAO = cDAO;
	}

	@Resource
	public void setStorageDAO(StorageDAO storageDAO) {
		this.storageDAO = storageDAO;
	}
}
