package com.ncut.wms.user.service;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ncut.wms.user.model.User;

public class UserServiceTest {

	public void testAdd() throws Exception {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		
		
		UserService service = (UserService)ctx.getBean("userService");
		service.add(new User());
		
		ctx.destroy();
		
	}

}
