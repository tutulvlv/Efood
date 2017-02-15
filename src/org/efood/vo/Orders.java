package org.efood.vo;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Orders entity. @author MyEclipse Persistence Tools
 */

public class Orders implements java.io.Serializable {

	// Fields

	private Integer orderid;
	private User user;
	private Date orderdate;
	private Set orderitems = new HashSet(0);
	public Integer getOrderid() {
		return orderid;
	}
	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Date getOrderdate() {
//		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return orderdate;
//		return orderdate;
	}
	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}
	public Set getOrderitems() {
		return orderitems;
	}
	public void setOrderitems(Set orderitems) {
		this.orderitems = orderitems;
	}
	public Orders( User user, Date orderdate, Set orderitems) {
		this.user = user;
		this.orderdate = orderdate;
		this.orderitems = orderitems;
	}
	public Orders(){}

}