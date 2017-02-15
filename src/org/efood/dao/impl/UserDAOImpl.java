package org.efood.dao.impl;

import java.util.List;

import org.efood.dao.BaseDAO;
import org.efood.dao.UserDAO;
import org.efood.vo.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class UserDAOImpl extends BaseDAO implements UserDAO{
	//验证用户是否存在
	@Override
	public User validateUser(String username, String password) {
		Session s=getSession();
		String hql="from User u where username=? and password=? and status=1";
		Query q = s.createQuery(hql);
		q.setParameter(0, username);
		q.setParameter(1, password);
		List<User> users=q.list();
		if(users.size()!=0){
			s.close();
			return users.get(0);
		}else{
			s.close();
			return null;
		}
	}
	//添加用户
	@Override
	public void saveUser(User user) {
		Session s=getSession();
		Transaction tx = s.beginTransaction();
		user.setStatus(1);
		s.save(user);
		tx.commit();
		s.close();
	}
	//更新用户信息
	@Override
	public void updateUser(User user) {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		user.setStatus(1);
		session.update(user);
		tx.commit();
		session.close();
	}
	//获取所有用户列表
	@Override
	public List<User> getAllUser() {
		Session s=getSession();
		String hql="from User u where status=1 order by u.id desc";
		Query q = s.createQuery(hql);
		List<User> users=q.list();
		s.close();
		return users;
		
	}
	//通过用户ID获取用户信息
	@Override
	public User getUserById(Integer id) {
		Session s=getSession();
		String hql="from User u where id=?";
		Query q = s.createQuery(hql);
		q.setParameter(0, id);
		List<User> users=q.list();
		s.close();
		return users.get(0);
	}
	//删除用户
	@Override
	public void deleteUser(Integer id) {
		Session s=getSession();
		Transaction tx = s.beginTransaction();
		String hql="update User u set u.status=0 where u.id=?";
		Query q = s.createQuery(hql);
		q.setParameter(0, id);
		q.executeUpdate();
		tx.commit();
		s.close();
	}
	
}
