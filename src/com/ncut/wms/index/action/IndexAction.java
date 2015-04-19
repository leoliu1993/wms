package com.ncut.wms.index.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 首页访问的Action
 * @author 刘思远
 *
 */

@Controller("index")
@Scope("prototype")
public class IndexAction extends ActionSupport{

	@Override
	public String execute() {
		
		return "index";
	}
}
