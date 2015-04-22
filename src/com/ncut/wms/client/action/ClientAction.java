package com.ncut.wms.client.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

@Controller("clientAction")
@Scope("prototype")
public class ClientAction extends ActionSupport {

	public String managementPage() {

		return "managementPage";
	}
}
