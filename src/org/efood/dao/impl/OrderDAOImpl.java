package org.efood.dao.impl;

import java.util.List;

import org.efood.dao.BaseDAO;
import org.efood.dao.OrderDAO;
import org.efood.vo.Orderitem;
import org.efood.vo.Orders;
import org.efood.vo.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class OrderDAOImpl extends BaseDAO implements OrderDAO{
	//保存订单和订单详情
	@Override
	public Orders saveOrder(Orders order) {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		session.save(order);
		tx.commit();
		session.close();
		return order;
	}
	//查询用户订单
	@Override
	public List<Orders> getOrderListByUser(int userid) {
		Session s=getSession();
		String hql="from Orders o where o.user.id=? order by o.orderid desc";
		Query q = s.createQuery(hql);
		q.setParameter(0, userid);
		List<Orders> ol=q.list();
		s.close();
		return ol;
	}
	//通过订单ID查询订单详情
	public List<Orderitem> getOrderitemByOrderid(Integer orderid){
		Session s=getSession();
		String hql="from Orderitem oi where oi.orders.orderid=?";
		Query q = s.createQuery(hql);
		q.setParameter(0, orderid);
		List<Orderitem> ol=q.list();
		s.close();
		return ol;
	}
	//对订单详情进行评价
	@Override
	public void saveComment(Integer orderitemid,String comment) {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		Query q = session.
				createQuery("update Orderitem oi set oi.comment=? where oi.orderitemid=?");
		q.setParameter(0, comment);
		q.setParameter(1, orderitemid);
		q.executeUpdate();
		tx.commit();
		session.close();
	}
	//获取订单详情评价
	@Override
	public List<Orderitem> getCommentByMenuid(Integer menuid) {
		Session s=getSession();
		String hql="from Orderitem o where o.menu.menuid=? order by o.orderitemid desc";
		Query q = s.createQuery(hql);
		q.setParameter(0, menuid);
		List<Orderitem> oil=q.list();
		s.close();
		return oil;
	}
	//通过状态查询订单详情
	@Override
	public List<Orderitem> getOrderitemByStatus(Integer status) {
		Session s=getSession();
		String hql="from Orderitem o where o.status=? order by o.orderitemid desc";
		Query q = s.createQuery(hql);
		q.setParameter(0, status);
		List<Orderitem> oil=q.list();
		s.close();
		return oil;
	}
	//更新订单
	@Override
	public void updateOrderitem(Integer orderitemid) {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		Query q = session.
				createQuery("update Orderitem oi set oi.status=? where oi.orderitemid=?");
		q.setParameter(0, 1);
		q.setParameter(1, orderitemid);
		q.executeUpdate();
		tx.commit();
		session.close();
	}
	//删除订单
	@Override
	public void deleteOrderitem(Integer orderitemid) {
		Session s=getSession();
		Transaction tx = s.beginTransaction();
		String hql="delete from Orderitem oi where oi.orderitemid=?";
		Query q = s.createQuery(hql);
		q.setParameter(0, orderitemid);
		q.executeUpdate();
		tx.commit();
		s.close();
	}
}
