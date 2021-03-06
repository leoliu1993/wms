package com.ncut.wms.base.dao.impl;

import java.lang.reflect.ParameterizedType;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.ncut.wms.base.dao.BaseDAO;

@SuppressWarnings("unchecked")
public class BaseDAOImpl<T> implements BaseDAO<T> {
	
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public void add(T t) {
		this.getSession().save(t);
	}

	@Override
	public void delete(int id) {
		this.getSession().delete(load(id));
	}

	@Override
	public void update(T t) {
		this.getSession().update(t);
		
	}

	@Override
	public void merge(Object t) {
		// TODO Auto-generated method stub
		
	}

	private Class<T> cls;

	public Class<T> getCls() {
		if(cls == null){
			cls = ((Class<T>)(((ParameterizedType)(this.getClass().getGenericSuperclass())).getActualTypeArguments()[0]));
		}
		return cls;
	}
	
	@Override
	public T load(int id) {
		return (T)this.getSession().get(this.getCls(), id);
	}

	@Override
	public Long count(String hql) {
		 return (Long)this.getSession().createQuery(hql).uniqueResult();
	}

	@Override
	public Long count(String hql, Map<String, Object> args) {
		Query query = this.getSession().createQuery(hql);
		if(args!=null && !args.isEmpty()){
			for(String key : args.keySet()){
				query.setParameter(key, args.get(key));
			}
		}
		return (Long)query.uniqueResult();
	}

	@Override
	public List<T> list(String hql) {
		return this.getSession().createQuery(hql).list();
	}

	@Override
	public List<T> list(String hql, Object arg) {
		return this.getSession().createQuery(hql)
				.setParameter(0, arg)
				.list();
	}

	@Override
	public List<T> list(String hql, Object[] args) {
		Query query = this.getSession().createQuery(hql);
		if(args != null){
			for(int i = 0;i<args.length;i++){
				query.setParameter(i, args[i]);
			}
		}
		return query.list();
	}

	@Override
	public List<T> list(String hql, int page, int rows) {
		Query query = this.getSession().createQuery(hql);
		return query.setFirstResult((page - 1)*rows)
				.setMaxResults(rows)
				.list();
	}

	@Override
	public List<T> list(String hql, Map<String, Object> args, int page, int rows) {
		Query query = this.getSession().createQuery(hql);
		if(args != null && !args.isEmpty()){
			for(String key : args.keySet()){
				query.setParameter(key, args.get(key));
			}
		}
		return query.setFirstResult((page-1)*rows).setMaxResults(rows).list();
	}

	@Resource
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

}
