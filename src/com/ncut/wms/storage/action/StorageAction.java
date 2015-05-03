package com.ncut.wms.storage.action;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.ncut.wms.storage.model.Storage;
import com.ncut.wms.storage.service.StorageService;
import com.opensymphony.xwork2.ActionSupport;

@Controller("storageAction")
@Scope("prototype")
public class StorageAction extends ActionSupport {

	/* ======以下业务逻辑======== */
	public String getStorageList() {
		List<Storage> storageList = sService.getStorageList();
		String storageJson = JSONArray.fromObject(storageList).toString();
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write(storageJson);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return NONE;
	}
	
	/* ======以下声明======== */
	private StorageService sService;

	@Resource
	public void setsService(StorageService sService) {
		this.sService = sService;
	}
}
