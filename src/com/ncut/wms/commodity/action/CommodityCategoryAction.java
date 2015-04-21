package com.ncut.wms.commodity.action;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.ncut.wms.commodity.dto.CommodityCategoryDTO;
import com.ncut.wms.commodity.model.CommodityCategory;
import com.ncut.wms.commodity.service.CommodityCategoryService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller("commodityCategoryAction")
@Scope("prototype")
public class CommodityCategoryAction extends ActionSupport implements
		ModelDriven<CommodityCategoryDTO> {

	/*========以下为声明部分========*/
	private CommodityCategoryService cmdtCtgrService;
	private CommodityCategoryDTO cmdtCtgrDTO;
	
	@Resource
	public void setCmdtCtgrService(CommodityCategoryService cmdtCtgrService) {
		this.cmdtCtgrService = cmdtCtgrService;
	}

	public void setCmdtCtgrDTO(CommodityCategoryDTO cmdtCtgrDTO) {
		this.cmdtCtgrDTO = cmdtCtgrDTO;
	}

	@Override
	public CommodityCategoryDTO getModel() {
		if(cmdtCtgrDTO == null) {
			cmdtCtgrDTO = new CommodityCategoryDTO();
		}
		return cmdtCtgrDTO;
	}
	
	/*========以下为逻辑部分========*/
	public String managementPage() {
		return "managementPage";
	}

	

}
