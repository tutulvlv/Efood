package org.efood.dao.impl;

import java.util.List;

import org.efood.dao.BaseDAO;
import org.efood.dao.MenuDAO;
import org.efood.vo.Menu;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class MenuDAOImpl extends BaseDAO implements MenuDAO {
	//随机获取9个菜品
	@Override
	public List<Menu> getRandomMenuList() {
		Session s=getSession();
		SQLQuery sq = s.createSQLQuery("SELECT * FROM Menu ORDER BY RAND() LIMIT 9")
				.addEntity(Menu.class);
		List<Menu> lm=sq.list();
		s.close();
		return lm;
	}
	//通过分类ID获取菜品列表并进行分页
	@Override
	public List<Menu> getMenuListByCatalog(Integer catalogid, int currentPage,
			int pageSize) {
		Session session=getSession();
		Query query=session.
				createQuery("from Menu m where m.catalog.catalogid=? order by m.menuid desc");
		query.setParameter(0, catalogid);
		int startRow=(currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List<Menu> m=query.list();
		session.close();
		return m;
	}
	//通过菜品ID获取菜品信息
	@Override
	public Menu getMenuById(Integer menuid) {
		Session session=getSession();
		Query query=session.
				createQuery("from Menu m where m.menuid=?");
		query.setParameter(0, menuid);
		Menu m=(Menu) query.list().get(0);
		session.close();
		return m;
	}
	//通过菜品名字获取菜品列表
	@Override
	public List<Menu> getMenuByName(String menuname) {
		Session session=getSession();
		Query query=session.
				createQuery("from Menu m where m.menuname like ? order by m.menuid desc");
		query.setParameter(0, "%"+menuname+"%");
		query.setFirstResult(0);
		query.setMaxResults(9);
		List<Menu> m=query.list();
		session.close();
		return m;
	}
	//通过价格区间获取菜品列表
	@Override
	public List<Menu> getMenuByPrice(double mixprice, double maxprice) {
		Session session=getSession();
		Query query=session.createQuery("from Menu m where m.price between ? and ? order by m.menuid desc");
		query.setParameter(0, mixprice);
		query.setParameter(1, maxprice);
		query.setFirstResult(0);
		query.setMaxResults(9);
		List<Menu> m=query.list();
		session.close();
		return m;
	}
	//获取所有菜品列表
	@Override
	public List<Menu> getAllMenu(int currentPage, int pageSize) {
		Session session=getSession();
		Query query=session.createQuery("from Menu m order by m.menuid desc");
		int startRow=(currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List<Menu> m=query.list();
		session.close();
		return m;
	}
	@Override
	public int getTotalMenu() {
		Session session=getSession();
		Query query=session.createQuery("from Menu m order by m.menuid desc");
		List<Menu> m=query.list();
		int t=m.size();
		session.close();
		return t;
	}
	//删除菜品
	@Override
	public void deleteMenu(Integer menuid) {
		Session s=getSession();
		Transaction tx = s.beginTransaction();
		String hql="delete from Menu m where m.menuid=?";
		Query q = s.createQuery(hql);
		q.setParameter(0, menuid);
		q.executeUpdate();
		tx.commit();
		s.close();
	}
	//更新菜品
	@Override
	public void updateMenu(Menu menu) {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		session.update(menu);
		tx.commit();
		session.close();
	}
	//保存菜品
	@Override
	public void saveMenu(Menu menu) {
		Session s=getSession();
		Transaction tx = s.beginTransaction();
		s.save(menu);
		tx.commit();
		s.close();
	}

	@Override
	public int getTotalByCatalog(Integer catalogid) {
		Session session=getSession();
		Query query=session.createQuery("from Menu m where m.catalog.catalogid=?");
		query.setParameter(0, catalogid);
		List<Menu> m=query.list();
		int t=m.size();
		session.close();
		return t;
	}
	
}
