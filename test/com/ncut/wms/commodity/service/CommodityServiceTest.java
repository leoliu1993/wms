package com.ncut.wms.commodity.service;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ncut.wms.commodity.dto.CommodityDTO;
import com.ncut.wms.commodity.model.Commodity;
import com.ncut.wms.commodity.model.CommodityCategory;
import com.ncut.wms.unit.model.Unit;
import com.ncut.wms.util.easyui.DataGrid;
import com.ncut.wms.util.json.ObjectJsonValueProcessor;

public class CommodityServiceTest {
	@Test
	public void testDatagrid() {

		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext(
				"applicationContext.xml");

		CommodityService service = (CommodityService) ctx.getBean("commodityService");
		CommodityDTO cDTO = new CommodityDTO();
		DataGrid<CommodityDTO> dg = service.datagrid(cDTO);
		System.out.println(JSONObject.fromObject(dg).toString());

		ctx.destroy();
		// fail("Not yet implemented");
	}
	
	public void testGetCommodityList() {

		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext(
				"applicationContext.xml");

		CommodityService service = (CommodityService) ctx.getBean("commodityService");
		List<Commodity>  commodityList = service.getDatagrid();
		for (Commodity commodity : commodityList) {
			System.out.println(commodity.toString());
		}

		ctx.destroy();
		// fail("Not yet implemented");
	}
	
	public void testGetCommodityListJson() {

			ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext(
					"applicationContext.xml");

			CommodityService service = (CommodityService) ctx
					.getBean("commodityService");
			
			String commodityListStr = service.getCommodityListJsonByPage(1, 10);
			System.out.println(commodityListStr);
			ctx.destroy();
		

		
		// fail("Not yet implemented");
	}
	
	public void testCustomJson() {

		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext(
				"applicationContext.xml");

		CommodityService service = (CommodityService) ctx
				.getBean("commodityService");

		List<Commodity> cList = service.getCommodityListByPage(1, 10);

		JsonConfig config = new JsonConfig();
		config.registerJsonValueProcessor(CommodityCategory.class,
				new ObjectJsonValueProcessor(
						new String[] { "commodityCategoryName" },
						CommodityCategory.class));
		config.registerJsonValueProcessor(Unit.class,
				new ObjectJsonValueProcessor(new String[] { "unitName" },
						Unit.class));
		String str = JSONArray.fromObject(cList, config).toString();
		System.out.println(str);

	}

}
