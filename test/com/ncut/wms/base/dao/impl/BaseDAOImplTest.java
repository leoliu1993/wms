package com.ncut.wms.base.dao.impl;

import static org.junit.Assert.fail;

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
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
@TestExecutionListeners(listeners = {
		DependencyInjectionTestExecutionListener.class,
		TransactionalTestExecutionListener.class })
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = true)
public class BaseDAOImplTest extends
		AbstractTransactionalJUnit4SpringContextTests {

	BaseDAOImpl<User> baseDAO;
	
	@Resource
	public void setBaseDAO(BaseDAOImpl<User> baseDAO) {
		this.baseDAO = baseDAO;
	}

	@Test
	@Transactional
	public void testAdd() {
		baseDAO.add(new User());
	}

	@Test
	@Transactional
	public void testDelete() {
	}

	@Test
	@Transactional
	public void testUpdate() {
	}
	
	@Test
	@Transactional
	public void testLoadInt() {
	}

	@Test
	@Transactional
	public void testCountString() {
	}

	@Test
	@Transactional
	public void testListString() {
		baseDAO.list("from User");
	}

}
