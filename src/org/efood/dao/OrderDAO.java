package org.efood.dao;

import java.util.List;

import org.efood.vo.Orderitem;
import org.efood.vo.Orders;
import org.efood.vo.User;

public interface OrderDAO {
	public Orders saveOrder(Orders order);
	public List<Orders> getOrderListByUser(int userid);
	public List<Orderitem> getOrderitemByOrderid(Integer orderid);
	public void saveComment(Integer orderitemid,String comment);
	public List<Orderitem> getCommentByMenuid(Integer menuid);
	public List<Orderitem> getOrderitemByStatus(Integer status);
	public void updateOrderitem(Integer orderitemid);
	public void deleteOrderitem(Integer orderitemid);
}
