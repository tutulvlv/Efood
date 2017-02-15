package org.efood.action;

import java.util.Date;
import java.util.Iterator;
import java.util.Map;

import org.efood.model.Cart;
import org.efood.service.MenuService;
import org.efood.service.OrderService;
import org.efood.vo.Menu;
import org.efood.vo.Orderitem;
import org.efood.vo.Orders;
import org.efood.vo.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ShoppingAction extends ActionSupport{
	MenuService menuService;
	OrderService orderService;
	private int quantity;
	private Integer menuid;
	private int method; //0代表删除，1代表减，2代表加
	//添加到购物车
	public String addToCart() throws Exception{
		Menu menu=menuService.getMenuById(menuid);
		Orderitem orderitem=new Orderitem();
		orderitem.setMenu(menu);
		orderitem.setQuantity(quantity);
		Map session=ActionContext.getContext().getSession();
		Cart cart=(Cart)session.get("cart");
		if(cart==null){
			cart=new Cart();
		}
		cart.addMenu(menuid, orderitem);
		cart.setTotalPrice();
		session.put("cart",cart);
		return SUCCESS;
	}
	//更新购物车
	public String updateCart() throws Exception{
		Map session=ActionContext.getContext().getSession();
		Cart cart=(Cart)session.get("cart");
		cart.updateCart(menuid,method);
		cart.setTotalPrice();
		session.put("cart", cart);
		return SUCCESS;
	}
	//提交订单
	public String submitOrder() throws Exception{
		Map session=ActionContext.getContext().getSession();
		User user=(User)session.get("u");
		Cart cart=(Cart)session.get("cart");
		if(user==null || cart ==null)
			return ActionSupport.ERROR;
		Orders order=new Orders();
		order.setOrderdate(new Date());
		order.setUser(user);
		for(Iterator it=cart.getItems().values().iterator();it.hasNext();){
			Orderitem orderitem=(Orderitem)it.next();
			orderitem.setOrders(order);
			orderitem.setStatus(0);
			order.getOrderitems().add(orderitem);
		}
		orderService.saveOrder(order);
		Map request=(Map)ActionContext.getContext().get("request");
		request.put("order",order);
		session.remove("cart");
		return SUCCESS;
	}
	public MenuService getMenuService() {
		return menuService;
	}
	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Integer getMenuid() {
		return menuid;
	}
	public void setMenuid(Integer menuid) {
		this.menuid = menuid;
	}
	public int getMethod() {
		return method;
	}
	public void setMethod(int method) {
		this.method = method;
	}

	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
}
