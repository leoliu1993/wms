package com.ncut.wms.stock.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class InStockServiceTest {

	@Test
	public void testGetOrder() throws Exception {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		
		
		InStockService service = (InStockService)ctx.getBean("inStockService");
		String date = "2015-01-29 00:00:00";
		String code = service.getOrderCode(date.substring(0, 10).replace("-", ""));
		assertEquals("RKJH201501290001",code);
		ctx.destroy();
		
	}
}
