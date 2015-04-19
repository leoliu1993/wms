package com.ncut.wms.commodity.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.ncut.wms.commodity.model.Commodity;
import com.ncut.wms.commodity.service.CommodityService;
import com.ncut.wms.unit.service.UnitService;
import com.ncut.wms.util.json.Json;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller("commodityAction")
@Scope("prototype")
public class CommodityAction extends ActionSupport implements
		ModelDriven<Commodity> {

	private CommodityService commodityService;
	private UnitService unitService;
	private Commodity commodity = new Commodity();

	/**
	 * 跳转商品信息管理页面
	 * 
	 * @return
	 */
	public String managementPage() {

		return "managementPage";
	}

	/**
	 * 获取商品信息列表
	 * 
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
		// 获取排序的方式
		String order = request.getParameter("order") == null ? "" : request
				.getParameter("order");
		// 获取排序的字段
		String sort = request.getParameter("sort") == null ? "" : request
				.getParameter("sort");

		// 查询数据存入map
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("commodityName", commodity.getCommodityName());
		m.put("sort", sort);
		m.put("order", order);

		// 通过分页获得对应商品列表的json字符串
		String commodityList = commodityService.getCommodityListJsonByPage(
				currentPage, pageSize, m);
		// 获得response对象,响应页面:
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(commodityList);
		return NONE;
	}

	/**
	 * 获取计量单位列表
	 * 
	 * @return
	 */
	public String getUnitList() {

		String unitList = unitService.getUnitListJson();

		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write(unitList);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return NONE;
	}

	/**
	 * 添加商品信息
	 * 
	 * @return
	 */
	public String addCommodity() {
		Json json = new Json();
		// 获得response对象,响应页面:
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			commodityService.add(commodity);
			json.setSuccess(true);
			json.setMessage("添加商品信息成功");
		} catch (Exception e) {
			e.printStackTrace();
			json.setSuccess(false);
			json.setMessage("添加商品信息失败");
		}
		try {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write(JSONObject.fromObject(json).toString());
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		return NONE;
	}

	/**
	 * 修改商品信息
	 * 
	 * @return
	 */
	public String updateCommodity() {
		Json json = new Json();
		// 获得response对象,响应页面:
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			commodityService.update(commodity);
			json.setSuccess(true);
			json.setMessage("修改商品信息成功");
		} catch (Exception e) {
			e.printStackTrace();
			json.setSuccess(false);
			json.setMessage("修改商品信息失败");
		}
		try {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write(JSONObject.fromObject(json).toString());
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		return NONE;
	}

	public String deleteCommodity() {
		Json json = new Json();
		// 获得response对象,响应页面:
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		try {
			String ids[] = request.getParameter("ids").split(",");
			System.out.println(ids.toString());

			for (int i = 0; i < ids.length; i++) {
				commodityService.delete(Integer.valueOf(ids[i]));
			}

			json.setSuccess(true);
			json.setMessage("删除商品信息成功");
		} catch (Exception e) {
			e.printStackTrace();
			json.setSuccess(false);
			json.setMessage("删除商品信息失败");
		}
		try {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write(JSONObject.fromObject(json).toString());
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		return NONE;
	}

	@Resource
	public void setCommodityService(CommodityService commodityService) {
		this.commodityService = commodityService;
	}

	@Resource
	public void setUnitService(UnitService unitService) {
		this.unitService = unitService;
	}

	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}

	@Override
	public Commodity getModel() {
		if (commodity.getCommodityName() == null) {
			commodity.setCommodityName("");
		}
		return commodity;
	}

}
