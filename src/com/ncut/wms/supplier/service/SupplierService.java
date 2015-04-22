package com.ncut.wms.supplier.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.ncut.wms.supplier.dao.SupplierDAO;
import com.ncut.wms.supplier.dto.SupplierDTO;
import com.ncut.wms.supplier.model.Supplier;
import com.ncut.wms.util.easyui.DataGrid;

@Service("supplierService")
public class SupplierService {
	
	private SupplierDAO supplierDAO;

	@Resource
	public void setSupplierDAO(SupplierDAO supplierDAO) {
		this.supplierDAO = supplierDAO;
	}

	public DataGrid<SupplierDTO> datagrid(SupplierDTO supplierDTO) {
		DataGrid<SupplierDTO> dg = new DataGrid<SupplierDTO>();
		Map<String,Object> map = new HashMap<String,Object>();
		String hql = "from Supplier supplier";
		if(supplierDTO.getSupplierName()!=null && !"".equals(supplierDTO.getSupplierName().trim())){
			hql+=" where supplier.supplierName like :supplierName";
			map.put("supplierName", "%"+supplierDTO.getSupplierName().trim()+"%");
		}
		String totalHql = "select count(*) "+hql;
		//实现排序
		if(supplierDTO.getSort()!=null){
			hql+=" order by "+supplierDTO.getSort()+" "+supplierDTO.getOrder();
		}
		List<Supplier> suppliers = supplierDAO.list(hql, map, supplierDTO.getPage(), supplierDTO.getRows());
		List<SupplierDTO> supplerDTOs = new ArrayList<SupplierDTO>();
		for(Supplier supp:suppliers){
			SupplierDTO suppDTO = new SupplierDTO();
			BeanUtils.copyProperties(supp, suppDTO);
			
			supplerDTOs.add(suppDTO);
		}
		dg.setTotals(supplierDAO.count(totalHql, map));
		dg.setRows(supplerDTOs);
		return dg;
	}

	public void add(Supplier supplier) {
		supplierDAO.add(supplier);
	}
	
	public void update(Supplier supplier) {
		supplierDAO.update(supplier);
	}
	
	public void delete(SupplierDTO supplierDTO) {
		
		String ids[] = supplierDTO.getIds().split(",");

		for (int i = 0; i < ids.length; i++) {
			supplierDAO.delete(Integer.valueOf(ids[i]));
		}

	}

}
