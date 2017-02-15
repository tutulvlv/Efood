package org.efood.service.impl;

import java.util.List;

import org.efood.dao.BaseDAO;
import org.efood.dao.OrderDAO;
import org.efood.service.OrderService;
import org.efood.vo.Orderitem;
import org.efood.vo.Orders;

public class OrderServiceImpl implements OrderService {
	OrderDAO orderDAO;
	public Orders saveOrder(Orders order) {
		return orderDAO.saveOrder(order);
	}
	@Override
	public List<Orders> getOrderListByUser(int userid) {
		return orderDAO.getOrderListByUser(userid);
	}
	@Override
	public List<Orderitem> getOrderitemByOrderid(Integer orderid) {
		return orderDAO.getOrderitemByOrderid(orderid);
	}
	@Override
	public void saveComment(Integer orderitemid, String comment) {
		orderDAO.saveComment(orderitemid, comment);
	}
	@Override
	public List<Orderitem> getCommentByMenuid(Integer menuid) {
		return orderDAO.getCommentByMenuid(menuid);
	}
	@Override
	public List<Orderitem> getOrderitemByStatus(Integer status) {
		return orderDAO.getOrderitemByStatus(status);
	}
	@Override
	public void updateOrderitem(Integer orderitemid) {
		orderDAO.updateOrderitem(orderitemid);
	}
	@Override
	public void deleteOrderitem(Integer orderitemid) {
		orderDAO.deleteOrderitem(orderitemid);
	}

	
	public OrderDAO getOrderDAO() {
		return orderDAO;
	}
	public void setOrderDAO(OrderDAO orderDAO) {
		this.orderDAO = orderDAO;
	}
}
