package org.efood.dao.impl;

import java.util.List;

import org.efood.dao.BaseDAO;
import org.efood.dao.CatalogDAO;
import org.efood.vo.Catalog;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class CatalogDAOImpl extends BaseDAO implements CatalogDAO {
	//获取全部菜品分类
	@Override
	public List<Catalog> getCatalogList() {
		Session s=getSession();
		String hql="from Catalog c";
		List<Catalog> lc=s.createQuery(hql).list();
		s.close();
		return lc;
	}
	//保存菜品分类
	@Override
	public void saveCatalog(Catalog catalog) {
		Session s=getSession();
		Transaction tx = s.beginTransaction();
		s.save(catalog);
		tx.commit();
		s.close();
	}
	//更新菜品分类
	@Override
	public void updateCatalog(Catalog catalog) {
		Session s=getSession();
		Transaction tx = s.beginTransaction();
		s.update(catalog);
		tx.commit();
		s.close();
	}
	//删除菜品分类
	@Override
	public void deleteCatalog(Integer catalogid) {
		Session s=getSession();
		Transaction tx = s.beginTransaction();
		String hql="delete from Catalog c where c.catalogid=?";
		Query q = s.createQuery(hql);
		q.setParameter(0, catalogid);
		q.executeUpdate();
		tx.commit();
		s.close();
	}

}
