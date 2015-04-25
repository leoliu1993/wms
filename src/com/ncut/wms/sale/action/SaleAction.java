package com.ncut.wms.sale.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.ncut.wms.purchase.dto.PurchaseDTO;
import com.ncut.wms.sale.dto.SaleDTO;
import com.ncut.wms.sale.model.Sale;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller("saleAction")
@Scope("prototype")
public class SaleAction extends ActionSupport implements ModelDriven<SaleDTO>  {

	/* ======以下业务逻辑======== */
	public String addPage() {

		return "addPage";
	}
	
	/* ======以下声明======== */
	private Sale s = new Sale();
	private SaleDTO sDTO;
	
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

	
	
}
