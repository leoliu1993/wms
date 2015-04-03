package com.ncut.wms.commodity.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ncut.wms.user.model.User;
import com.ncut.wms.user.service.UserService;

public class CommodityServiceTest {

	@Test
	public void testGetCommodityList() {

		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext(
				"applicationContext.xml");

		CommodityService service = (CommodityService) ctx.getBean("commodityService");
		String str = service.getCommodityList().toString();
		System.out.println(str);

		ctx.destroy();
		// fail("Not yet implemented");
	}

}
