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

@Component("commodity")
@Scope("prototype")
public class CommodityAction extends ActionSupport {

	@Resource
	private CommodityService commodityService;
	
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
		
		List<Commodity> commodityList = commodityService.getCommodityListByPage(currentPage, pageSize);
		// 获得response对象,响应页面:
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		// 拼Jason字符串
		int total = commodityService.total();
		String commodityListStr =  "{\"total\":"+total+" , \"rows\":"+JSONArray.fromObject(commodityList).toString()+"}";
		response.getWriter().write(commodityListStr);
		return NONE;
	}

}
