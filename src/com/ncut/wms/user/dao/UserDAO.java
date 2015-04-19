package com.ncut.wms.user.dao;

import java.util.List;

import com.ncut.wms.user.model.User;

public interface UserDAO {
	
	//注册用户存入
	public void save(User user);
	
	/**
	 * 查询所有用户
	 * @return
	 */
	public List<User> findAll();

}
