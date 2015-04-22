package com.ncut.wms.user.dao.impl;



import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.ncut.wms.base.dao.impl.BaseDAOImpl;
import com.ncut.wms.user.dao.UserDAO;
import com.ncut.wms.user.model.User;

@Component("userDAO")
public class UserDAO4MySqlImpl extends BaseDAOImpl<User> implements UserDAO {
	
	

	@Override
	public List<User> findAll() {
		String hql = "from User";
		List<User> userList = this.getSession().createQuery(hql).list();
		return userList;
	}

	

	@Override
	public User getUser(String username) {
		User user = new User();
		String hql = "from User u where u.loginname = :name";
		user = (User)this.getSession().createQuery(hql)
			.setString("name", username)
			.uniqueResult();
		return user;
	}
	
	
}
