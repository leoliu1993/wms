package com.ncut.wms.user.action;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.ncut.wms.user.model.User;
import com.ncut.wms.user.service.UserService;
import com.ncut.wms.util.json.Json;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller("userAction")
@Scope("prototype")
public class UserAction extends ActionSupport implements ModelDriven<User> {
	
	/*========以下为声明部分========*/
	private UserService userService;
	private User user;
	
	public UserService getUserService() {
		return userService;
	}

	@Resource
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public User getModel() {
		if(user == null) {
			user = new User();
		}
		return user;
	}
	
	/*========以下为逻辑部分========*/
	
	@Override
	public String execute()  {
		
		return "index";
	}
	
	public String login(){
		Json json = new Json();
		HttpServletResponse response = ServletActionContext.getResponse();
		
		User u = userService.login(user.getLoginname());
		if(u != null) {
			if(user.getPassword().equals(u.getPassword())){
				ServletActionContext.getRequest().getSession().setAttribute("curUser", u);
				ActionContext.getContext().put("rurl", "home_showHome");
				json.setSuccess(true);
				json.setMessage("登陆成功欢迎进入智慧仓库管理系统");
			}else{
				json.setSuccess(false);
				json.setMessage("账号或密码错误");
			}
		}else{
			json.setSuccess(false);
			json.setMessage("账号或密码错误");
		}
		
		try {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write(JSONObject.fromObject(json).toString());
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		return NONE;
		
	}
	
}
