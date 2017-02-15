package org.efood.action;

import java.util.List;
import java.util.Map;

import org.efood.service.OrderService;
import org.efood.vo.Orderitem;
import org.efood.vo.Orders;
import org.efood.vo.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class OrderAction extends ActionSupport{
	OrderService orderService;
	int orderid;
	int orderitemid;
	String comment;
	//显示用户订单列表
	public String showOrderList(){
		Map session=ActionContext.getContext().getSession();
		User u=(User)session.get("u");
		if(u==null){
			return ERROR;
		}
		int userid=u.getId();
		List<Orders> ol = orderService.getOrderListByUser(userid);
		System.out.println(userid);
		Map request=(Map) ActionContext.getContext().get("request");
		request.put("ol", ol);
		return SUCCESS;
	}
	//显示订单详情
	public String showOrderitem() throws Exception {
		List<Orderitem> orderitems=orderService.getOrderitemByOrderid(orderid);
		Map request=(Map)ActionContext.getContext().get("request");
		request.put("orderitems",orderitems);
		return SUCCESS;
	}
	//对订单详情进行评价
	public String saveComment(){
		orderService.saveComment(orderitemid, comment);
		List<Orderitem> orderitems=orderService.getOrderitemByOrderid(orderid);
		Map request=(Map)ActionContext.getContext().get("request");
		request.put("orderitems",orderitems);
		return SUCCESS;
	}
	public OrderService getOrderService() {
		return orderService;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public int getOrderitemid() {
		return orderitemid;
	}
	public void setOrderitemid(int orderitemid) {
		this.orderitemid = orderitemid;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
}
