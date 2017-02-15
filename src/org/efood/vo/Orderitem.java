package org.efood.vo;

/**
 * Orderitem entity. @author MyEclipse Persistence Tools
 */

public class Orderitem implements java.io.Serializable {

	// Fields

	private Integer orderitemid;
	private Menu menu;
	private Orders orders;
	private Integer quantity;
	private String comment;
	private Integer status;

	// Constructors

	/** default constructor */
	public Orderitem() {
	}
	
	
	public Orderitem(Menu menu, Orders orders, Integer quantity,
			String comment, Integer status) {
		super();
		this.menu = menu;
		this.orders = orders;
		this.quantity = quantity;
		this.comment = comment;
		this.status = status;
	}


	public Integer getOrderitemid() {
		return orderitemid;
	}

	public void setOrderitemid(Integer orderitemid) {
		this.orderitemid = orderitemid;
	}

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public Orders getOrders() {
		return orders;
	}

	public void setOrders(Orders orders) {
		this.orders = orders;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	
}