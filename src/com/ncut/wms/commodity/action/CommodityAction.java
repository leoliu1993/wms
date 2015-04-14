package com.ncut.wms.commodity.action;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.ncut.wms.commodity.model.Commodity;
import com.ncut.wms.commodity.service.CommodityService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Component("commodityAction")
@Scope("prototype")
public class CommodityAction extends ActionSupport implements ModelDriven<Commodity> {

	@Resource
	private CommodityService commodityService;
	
	private Commodity commodity = new Commodity();
	
	/**
	 * 跳转商品信息管理页面
	 * @return
	 */
	public String managementPage() {
		
		return "managementPage";
	}
	
	/**
	 * 获取商品信息列表
	 * @return
	 * @throws IOException 
	 */
	public String getCommodityList() throws IOException {
		
		// 获得request对象，获取页面数据
		HttpServletRequest request = ServletActionContext.getRequest();
		// 获得当前页
		int currentPage = Integer.parseInt(request.getParameter("page"));
		// 获得一页显示的数据数量
		int pageSize = Integer.parseInt(request.getParameter("rows"));
		//通过分页获得对应商品列表的json字符串
		String commodityList = commodityService.getCommodityListJson(currentPage, pageSize);
		// 获得response对象,响应页面:
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(commodityList);
		return NONE;
	}
	
	/**
	 * 添加商品信息
	 * @return
	 */
	public String addCommodity() {
		// 获得response对象,响应页面:
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			commodityService.add(commodity);
			response.setContentType("text/html;charset=UTF-8");
			String str = "{\"status\":\"ok\" , \"message\":\"操作成功!\"}";

			response.getWriter().write(str);
		} catch (IOException e) {
			response.setContentType("text/html;charset=utf-8");
			String str = "{\"status\":\"fail\" , \"message\":\"操作失败!\"}";
			try {
				response.getWriter().write(str);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		return NONE;
	}

	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}

	@Override
	public Commodity getModel() {
		return commodity;
	}


}
