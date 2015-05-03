package com.ncut.wms.stock.action;

import java.io.IOException;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.ncut.wms.stock.dto.StockDTO;
import com.ncut.wms.stock.model.Stock;
import com.ncut.wms.stock.service.StockService;
import com.ncut.wms.supplier.dto.SupplierDTO;
import com.ncut.wms.util.easyui.DataGrid;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller("stockAction")
@Scope("prototype")
public class StockAction extends ActionSupport implements ModelDriven<StockDTO> {

	/* ======以下业务逻辑======== */
	public String managementPage() {

		return "managementPage";
	}

	public String getDatagrid() {

		DataGrid<StockDTO> dg = sService.datagrid(sDTO);
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
		try {
			ServletActionContext.getResponse().getWriter().write(JSONObject.fromObject(dg).toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return NONE;
	}
	
	/* ======以下声明======== */
	private Stock s = new Stock();
	private StockDTO sDTO;
	private StockService sService;
	
	@Override
	public StockDTO getModel() {
		if(sDTO == null) {
			sDTO = new StockDTO();
		}
		return null;
	}

	public void setS(Stock s) {
		this.s = s;
	}

	public void setsDTO(StockDTO sDTO) {
		this.sDTO = sDTO;
	}

	@Resource
	public void setsService(StockService sService) {
		this.sService = sService;
	}

}
