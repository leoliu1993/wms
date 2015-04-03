package com.ncut.wms.user.dao.impl;



import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.ncut.wms.user.dao.UserDAO;
import com.ncut.wms.user.model.User;

@Component("userDAO")
public class UserDAO4MySqlImpl implements UserDAO {
	
	private SessionFactory sessionFactory;

	@Override
	public void save(User user) {
		
			Session session = sessionFactory.getCurrentSession();
			session.save(user);
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	@Resource
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

}
