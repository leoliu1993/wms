package com.ncut.wms.user.service;

import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Component;

import com.ncut.wms.user.dao.UserDAO;
import com.ncut.wms.user.model.User;

@Component("userService")
public class UserService {

	private UserDAO userDAO;
	
	public void add(User user) {
		userDAO.save(user);
	}
	
	public List<User> getUserList() {
		List<User> userList = userDAO.findAll();
		return userList;
	}
	
	public String getUserListJson() {
		List<User> userList = userDAO.findAll();
		String json = JSONArray.fromObject(userList).toString();
		return json;
	}

	public UserDAO getUserDAO() {
		return userDAO;
	}

	@Resource
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

}
