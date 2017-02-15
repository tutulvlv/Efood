package org.efood.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.efood.service.AdminService;
import org.efood.service.OrderService;
import org.efood.service.UserService;
import org.efood.vo.Admin;
import org.efood.vo.Orderitem;
import org.efood.vo.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AdminAction extends ActionSupport{
	AdminService adminService;
	UserService userService;
	OrderService orderService;
	Admin admin;
	int adminid;
	int id;
	int orderitemid;
	//管理员登录
	public String adminLogin(){
		Admin a = adminService.validateAdmin(admin.getAdminname(), admin.getPassword());
		if(a!=null){
			ActionContext.getContext().getSession().put("a",a);
			a.setLasttime(new Date());
			adminService.updateAdmin(a);
			return SUCCESS;
		}
		return ERROR;
	}
	//管理员注销
	public String adminLogout(){
		ActionContext.getContext().getSession().remove("a");
		return SUCCESS;
	}
	//显示管理员列表
	public String showAdminList(){
		List<Admin> adminList = adminService.getAllAdmin();
		((Map)ActionContext.getContext().
				get("request")).put("adminList",adminList);
		return SUCCESS;
	}
	//删除管理员
	public String deleteAdmin(){
		adminService.deleteAdmin(adminid);
		return SUCCESS;
	}
	//添加管理员
	public String addAdmin(){
		adminService.saveAdmin(admin);
		System.out.println(admin.getLasttime());
		return SUCCESS;
	}
	//显示单个管理员信息
	public	String showAdmin(){
		Admin a = adminService.getAdminById(adminid);
		Map re=(Map) ActionContext.getContext().get("request");
		re.put("admin", a);
		return SUCCESS;
	}
	//修改管理员信息
	public String modifyAdmin(){
		adminService.updateAdmin(admin);
		return SUCCESS;
	}
	//显示所有用户列表
	public String showUserList(){
		List<User> userList = userService.getAllUser();
		((Map)ActionContext.getContext().get("request")).put("userList",userList);
		return SUCCESS;
	}
	//显示用户信息
	public String showUser(){
		User u = userService.getUserById(id);
		((Map)ActionContext.getContext().get("request")).put("user",u);
		return SUCCESS;
	}
	//删除用户
	public String deleteUser(){
		userService.deleteUser(id);
		return SUCCESS;
	}
	//显示待处理订单
	public String showPendingOrders(){
		List<Orderitem> oil = orderService.getOrderitemByStatus(0);
		((Map)ActionContext.getContext().get("request")).put("oil",oil);
		return SUCCESS;
	}
	//显示待已完成订单
	public String showDoneOrders(){
		List<Orderitem> oil = orderService.getOrderitemByStatus(1);
		((Map)ActionContext.getContext().get("request")).put("oil",oil);
		return SUCCESS;
	}
	//发货
	public String modifyOrderStatus(){
		orderService.updateOrderitem(orderitemid);
		return SUCCESS;
	}
	//删除已完成订单
	public String deleteOrderitem(){
		orderService.deleteOrderitem(orderitemid);
		return SUCCESS;
	}
	
	
	public AdminService getAdminService() {
		return adminService;
	}
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	public int getAdminid() {
		return adminid;
	}
	public void setAdminid(int adminid) {
		this.adminid = adminid;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public OrderService getOrderService() {
		return orderService;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public int getOrderitemid() {
		return orderitemid;
	}
	public void setOrderitemid(int orderitemid) {
		this.orderitemid = orderitemid;
	}
	
}
