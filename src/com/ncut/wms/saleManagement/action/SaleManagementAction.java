package com.ncut.wms.saleManagement.action;

import java.io.IOException;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.ncut.wms.saleManagement.dto.SaleManagementDTO;
import com.ncut.wms.saleManagement.service.SaleManagementService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller("saleManagementAction")
@Scope("prototype")
public class SaleManagementAction extends ActionSupport implements
		ModelDriven<SaleManagementDTO> {

	/* ======以下业务逻辑======== */
	public String saleAddPage() {
		return "saleAddPage";
	}

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
