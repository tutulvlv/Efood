package org.efood.dao.impl;

import java.util.List;

import org.efood.dao.AdminDAO;
import org.efood.dao.BaseDAO;
import org.efood.vo.Admin;
import org.efood.vo.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class AdminDAOImpl extends BaseDAO implements AdminDAO{
	//验证管理员是否存在
	@Override
	public Admin validateAdmin(String adminname, String password) {
		Session s=getSession();
		String hql="from Admin a where adminname=? and password=?";
		Query q = s.createQuery(hql);
		q.setParameter(0, adminname);
		q.setParameter(1, password);
		List<Admin> admin=q.list();
		if(admin.size()!=0){
			s.close();
			return admin.get(0);
		}else{
			s.close();
			return null;
		}
	}
	//获取所有管理员列表
	@Override
	public List<Admin> getAllAdmin() {
		Session s=getSession();
		String hql="from Admin a";
		Query q = s.createQuery(hql);
		List<Admin> adminList=q.list();
		s.close();
		return adminList;
	}
	//删除管理员
	@Override
	public void deleteAdmin(Integer adminid) {
		Session s=getSession();
		Transaction tx = s.beginTransaction();
		String hql="delete from Admin a where a.adminid=?";
		Query q = s.createQuery(hql);
		q.setParameter(0, adminid);
		q.executeUpdate();
		tx.commit();
		s.close();
	}
	//保存管理员
	@Override
	public void saveAdmin(Admin admin) {
		Session s=getSession();
		Transaction tx = s.beginTransaction();
		s.save(admin);
		tx.commit();
		s.close();
	}
	//通过ID获取管理员信息
	@Override
	public Admin getAdminById(Integer adminid) {
		Session s=getSession();
		String hql="from Admin a where a.adminid=?";
		Query q = s.createQuery(hql);
		q.setParameter(0, adminid);
		List<Admin> admin=q.list();
		s.close();
		return admin.get(0);
	}
	//修改管理员
	@Override
	public void updateAdmin(Admin admin) {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		session.update(admin);
		tx.commit();
		session.close();
	}
	
}
