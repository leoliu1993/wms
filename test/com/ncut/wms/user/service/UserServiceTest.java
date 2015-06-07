package com.ncut.wms.user.service;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.test.context.transaction.TransactionalTestExecutionListener;
import org.springframework.transaction.annotation.Transactional;

import com.ncut.wms.user.model.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
@TestExecutionListeners(listeners={
		DependencyInjectionTestExecutionListener.class,
		TransactionalTestExecutionListener.class
})
@TransactionConfiguration(transactionManager="transactionManager",defaultRollback=true)
public class UserServiceTest extends
		AbstractTransactionalJUnit4SpringContextTests {
	
	private UserService service;
	
	@Resource
	public void setService(UserService service) {
		this.service = service;
	}

	@Test
	@Transactional
	public void testAdd() {
		service.add(new User());
	}
	
	@Test
	@Transactional
	public void testUpdate() {
		User user = service.findById(2);
		user.setUsername("test");
		service.update(user);
	}

	@Test
	@Transactional
	public void testDelete() {
		service.delete("3");
	}

	@Test
	@Transactional
	public void testLogin() {
		service.login("admin");
	}

}
