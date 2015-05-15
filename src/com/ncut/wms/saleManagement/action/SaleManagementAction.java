package com.ncut.wms.saleManagement.action;

import java.io.IOException;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.ncut.wms.purchaseManagement.dto.PurchaseManagementDTO;
import com.ncut.wms.saleManagement.dto.SaleManagementDTO;
import com.ncut.wms.saleManagement.service.SaleManagementService;
import com.ncut.wms.util.easyui.DataGrid;
import com.ncut.wms.util.json.Json;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller("saleManagementAction")
@Scope("prototype")
public class SaleManagementAction extends ActionSupport implements
		ModelDriven<SaleManagementDTO> {

	/* ======以下业务逻辑======== */
	/**
	 * 跳转到商品销售页面
	 * @return
	 */
	public String saleAddPage() {
		return "saleAddPage";
	}
	
	/**
	 * 跳转到销售出库页面
	 * @return
	 */
	public String saleStockOutPage() {
		return "saleStockOutPage";
	}
	
	public String saleReturnPage() {
		return "saleReturnPage";
	}

	/**
	 * 获得商品和对应的库存信息
	 * @return
	 */
	public String getCommodityAndStock() {
		SaleManagementDTO cs = smService.getCommodityAndStock(smDTO);
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
		try {
			ServletActionContext.getResponse().getWriter()
					.write(JSONObject.fromObject(cs).toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return NONE;
	}
	
	/**
	 * 获得销售编号
	 * @return
	 */
	public String getSaleCode() {
		smDTO.setOrderId(smService.getSaleCode(smDTO.getCreateDate()));
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
		try {
			ServletActionContext.getResponse().getWriter()
					.write(JSONObject.fromObject(smDTO).toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return NONE;
	}
	
	/**
	 * 存储销售单据
	 * @return
	 */
	public String saveSale() {
		Json json = new Json();
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
		try {
			smService.saveSale(smDTO);
			json.setSuccess(true);
			json.setMessage("添加销售订单成功");
		} catch (Exception e) {
			e.printStackTrace();
			json.setSuccess(false);
			json.setMessage("添加销售订单失败");
		}
		try {
			ServletActionContext.getResponse().getWriter().write(JSONObject.fromObject(json).toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return NONE;
	}
	
	/**
	 * 存储销售出库单据
	 * @return
	 */
	public String saveSaleStockOut() {
		Json json = new Json();
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
		try {
			smService.saveSaleStockOut(smDTO);
			json.setSuccess(true);
			json.setMessage("添加销售出库单据成功");
		} catch (Exception e) {
			e.printStackTrace();
			json.setSuccess(false);
			json.setMessage("添加销售出库单据失败");
		}
		try {
			ServletActionContext.getResponse().getWriter().write(JSONObject.fromObject(json).toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return NONE;
	}
	
	/**
	 * 获得销售总单表格(easyui)
	 * @return
	 */
	public String getSaleTotalGrid() {
		DataGrid<SaleManagementDTO> dg = smService.getSaleTotalGrid(smDTO);
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
		try {
			ServletActionContext.getResponse().getWriter().write(JSONObject.fromObject(dg).toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return NONE;
	}
	
	/**
	 * 获得销售详单表格(easyui)
	 * @return
	 */
	public String getSaleDetailGrid() {
		DataGrid<SaleManagementDTO> dg = smService.getSaleDetailGrid(smDTO);
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
		try {
			ServletActionContext.getResponse().getWriter().write(JSONObject.fromObject(dg).toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return NONE;
	}

	/* ======以下声明======== */
	private SaleManagementDTO smDTO;
	private SaleManagementService smService;

	@Override
	public SaleManagementDTO getModel() {
		if (smDTO == null) {
			smDTO = new SaleManagementDTO();
		}
		return smDTO;
	}

	public void setSmDTO(SaleManagementDTO smDTO) {
		this.smDTO = smDTO;
	}

	@Resource
	public void setSmService(SaleManagementService smService) {
		this.smService = smService;
	}

}
