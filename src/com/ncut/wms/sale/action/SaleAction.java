package com.ncut.wms.sale.action;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.ncut.wms.sale.dto.SaleDTO;
import com.ncut.wms.sale.model.Sale;
import com.ncut.wms.sale.service.SaleService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller("saleAction")
@Scope("prototype")
public class SaleAction extends ActionSupport implements ModelDriven<SaleDTO>  {

	/* ======以下业务逻辑======== */
	public String addPage() {

		return "addPage";
	}
	
	public String getOrderCode() {
		
		String orderCode = sService.getOrderCode(sDTO.getCreateDate());
		sDTO.setSaleId(orderCode);
		String saleJson = JSONObject.fromObject(sDTO).toString();
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write(saleJson);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return NONE;
	}
	
	/* ======以下声明======== */
	private Sale s = new Sale();
	private SaleDTO sDTO;
	private SaleService sService;
	
	public void setS(Sale s) {
		this.s = s;
	}

	public void setsDTO(SaleDTO sDTO) {
		this.sDTO = sDTO;
	}
	
	@Override
	public SaleDTO getModel() {
		if(sDTO == null) {
			sDTO = new SaleDTO();
		}
		return sDTO;
	}

	@Resource
	public void setsService(SaleService sService) {
		this.sService = sService;
	}

	
	
}
