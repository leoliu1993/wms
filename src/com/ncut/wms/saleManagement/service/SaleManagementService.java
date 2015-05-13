package com.ncut.wms.saleManagement.service;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.ncut.wms.client.dao.impl.ClientDAO;
import com.ncut.wms.client.model.Client;
import com.ncut.wms.commodity.dao.CommodityCategoryDAO;
import com.ncut.wms.commodity.dao.CommodityDAO;
import com.ncut.wms.commodity.model.Commodity;
import com.ncut.wms.commodity.model.CommodityCategory;
import com.ncut.wms.saleManagement.dto.SaleManagementDTO;
import com.ncut.wms.stock.dao.TotalStockDAO;
import com.ncut.wms.stock.model.TotalStock;
import com.ncut.wms.unit.dao.UnitDAO;
import com.ncut.wms.unit.model.Unit;

@Service("saleManagementService")
public class SaleManagementService {

	/* ======以下业务逻辑======== */
	public SaleManagementDTO getCommodityAndStock(SaleManagementDTO smDTO) {
		
		Commodity commodity = commodityDAO.load(smDTO.getCommodityId());
		CommodityCategory cc = ccDAO.load(commodity.getCategoryId());
		Unit unit = unitDAO.load(commodity.getUnitId());
		TotalStock ts = tsDAO.findByCommodityId(commodity.getCommodityId());
		Client client = clientDAO.load(smDTO.getClientId());
		CommodityCategory cc = ccDAO.load(commodity.getCategoryId());
		Unit unit = unitDAO.load(commodity.getUnitId());
		
		BeanUtils.copyProperties(commodity, smDTO);
		BeanUtils.copyProperties(ts, smDTO);
		
		//设定对应客户级别的售价
		if(client.getLevel() == 0) {
			smDTO.setPrice(commodity.getSalePrice());
		}
		if(client.getLevel() == 1) {
			smDTO.setPrice(commodity.getVip1Price());
		}
		if(client.getLevel() == 2) {
			smDTO.setPrice(commodity.getVip2Price());
		}
		if(client.getLevel() == 3) {
			smDTO.setPrice(commodity.getVip3Price());
		}
		
		//设置类别
		smDTO.setCategoryName(cc.getCname());
		//设置计量单位
		smDTO.setUnitName(unit.getUnitName());
		
		return smDTO;
	}

	/* ======以下声明======== */
	private CommodityDAO commodityDAO;
	private CommodityCategoryDAO ccDAO;
	private UnitDAO unitDAO;
	private TotalStockDAO tsDAO;
	private ClientDAO clientDAO;

	@Resource
	public void setCommodityDAO(CommodityDAO cDAO) {
		this.commodityDAO = cDAO;
	}

	@Resource
	public void setTsDAO(TotalStockDAO tsDAO) {
		this.tsDAO = tsDAO;
	}

	@Resource
	public void setClientDAO(ClientDAO clientDAO) {
		this.clientDAO = clientDAO;
	}

	@Resource
	public void setCcDAO(CommodityCategoryDAO ccDAO) {
		this.ccDAO = ccDAO;
	}

	@Resource
	public void setUnitDAO(UnitDAO unitDAO) {
		this.unitDAO = unitDAO;
	}

}
