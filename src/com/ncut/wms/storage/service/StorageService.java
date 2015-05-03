package com.ncut.wms.storage.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ncut.wms.storage.dao.StorageDAO;
import com.ncut.wms.storage.model.Storage;

@Service("storageService")
public class StorageService {
	
	/* ======以下业务逻辑======== */
	public List<Storage> getStorageList() {
		return sDAO.list("from Storage");
	}
	
	/* ======以下声明======== */
	private StorageDAO sDAO;

	@Resource
	public void setsDAO(StorageDAO sDAO) {
		this.sDAO = sDAO;
	}

	
}
