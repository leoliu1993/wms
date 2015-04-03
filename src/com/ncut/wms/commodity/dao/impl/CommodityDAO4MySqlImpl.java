package com.ncut.wms.commodity.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.ncut.wms.commodity.dao.CommodityDAO;
import com.ncut.wms.commodity.model.Commodity;

@Component("commodityDAO")
public class CommodityDAO4MySqlImpl implements CommodityDAO {

	private SessionFactory sessionFactory;

	@Override
	public List<Commodity> findAll() {
		String hql = "from Commodity";
		List<Commodity> commodityList = getSession().createQuery(hql)
				.list();
		return commodityList;
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	@Resource
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	/**
	 * sessionFactory获取session
	 * @return
	 */
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public List<Commodity> findByPagination(int currentPage, int pageSize) {
		//计算分页后显示的第一个数据的索引号
		int index = (currentPage-1)*pageSize;
		String hql = "from Commodity";
		Query query = getSession().createQuery(hql);
		//设置查询开始的索引号
		query.setFirstResult(index);
		//查询所显示的数据数
		query.setMaxResults(pageSize);
		List<Commodity> commodityList = query.list();
		return commodityList;
	}

	@Override
	public int count() {
		String hql = "select count(*) from Commodity";
		Query query = getSession().createQuery(hql);
		int count = (Integer) query.uniqueResult();
		return count;
	}

}
