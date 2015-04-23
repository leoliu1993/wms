package com.ncut.wms.purchase.action;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.ncut.wms.purchase.dto.PurchaseDTO;
import com.ncut.wms.purchase.dto.PurchasegoodsDTO;
import com.ncut.wms.purchase.model.Purchase;
import com.ncut.wms.purchase.model.Purchasegoods;
import com.ncut.wms.purchase.service.PurchaseService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller("purchaseAction")
@Scope("prototype")
public class PurchaseAction extends ActionSupport implements ModelDriven<PurchaseDTO> {

	/* ======以下业务逻辑======== */
	public String addPage() {

		return "addPage";
	}
	
	
	
	/* ======以下声明======== */
	private Purchase p;
	private PurchaseDTO pDTO;
	private Purchasegoods pg;
	private PurchasegoodsDTO pgDTO;
	private PurchaseService pService;

	public void setP(Purchase p) {
		this.p = p;
	}

	public void setpDTO(PurchaseDTO pDTO) {
		this.pDTO = pDTO;
	}

	public void setPg(Purchasegoods pg) {
		this.pg = pg;
	}

	public void setPgDTO(PurchasegoodsDTO pgDTO) {
		this.pgDTO = pgDTO;
	}

	@Resource
	public void setpService(PurchaseService pService) {
		this.pService = pService;
	}

	@Override
	public PurchaseDTO getModel() {
		if(pDTO == null) {
			pDTO = new PurchaseDTO();
		}
		return pDTO;
	}

}
