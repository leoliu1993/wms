package com.ncut.wms.purchase.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.util.JSONUtils;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.ncut.wms.purchase.dto.PurchaseDTO;
import com.ncut.wms.purchase.dto.PurchasegoodsDTO;
import com.ncut.wms.purchase.model.Purchase;
import com.ncut.wms.purchase.model.Purchasegoods;
import com.ncut.wms.purchase.service.PurchaseService;
import com.ncut.wms.supplier.model.Supplier;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller("purchaseAction")
@Scope("prototype")
public class PurchaseAction extends ActionSupport implements ModelDriven<PurchaseDTO> {

	/* ======以下业务逻辑======== */
	public String addPage() {

		return "addPage";
	}
	
	public String getOrderCode() {
		
		String orderCode = pService.getOrderCode(pDTO.getCreateDate());
		pDTO.setPurchaseId(orderCode);
		String purchaseJson = JSONObject.fromObject(pDTO).toString();
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write(purchaseJson);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return NONE;
	}
	
	@SuppressWarnings("unused")
	public String saveOrder() {
		JSONArray jArr = JSONArray.fromObject(pDTO.getPgs());
		List<Purchasegoods> pgList = new ArrayList<Purchasegoods>();
		for(int i=0; i<jArr.size(); i++) {
			
			JSONObject jObj = JSONObject.fromObject(jArr.get(i));
			
			Purchasegoods pg = new Purchasegoods();
			//对商品详单赋值
			pg.setPurchaseId(jObj.getString("purchaseId"));
			pg.setCommodityId(jObj.getInt("commodityId"));
			if(jObj.getString("price") == null || "".equals(jObj.getString("price"))) {
				pg.setPrice(0.0);
			} else {
				pg.setPrice(jObj.getDouble("price"));
			}
			if(jObj.getString("amount") == null || "".equals(jObj.getString("amount"))) {
				pg.setAmount(0);
			} else {
				pg.setAmount(jObj.getInt("amount"));
			}
			pg.setTotalPrice(jObj.getDouble("totalPrice"));
			pgList.add(pg);
			System.out.println("---");
		}
		return NONE;
	}
	
	
	
	/* ======以下声明======== */
	private Purchase p;
	private PurchaseDTO pDTO;
	private Purchasegoods pg;
	private PurchasegoodsDTO pgDTO;
	private PurchasegoodsDTO [] pgDTOs;
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

	public void setPgDTOs(PurchasegoodsDTO[] pgDTOs) {
		this.pgDTOs = pgDTOs;
	}

}
