package org.efood.action;

import java.util.Map;

import org.efood.service.UserService;
import org.efood.vo.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport{
	private User user;
	private UserService userService;
	//用户登录
	public String login(){
		User u = userService.
				validateUser(user.getUsername(), user.getPassword());
		if(u!=null){
			ActionContext.getContext().getSession().put("u",u);
			return SUCCESS;
		}
		return ERROR;
	}
	//用户注销
	public String logout(){
		ActionContext.getContext().getSession().remove("u");
		return SUCCESS;
	}
	//用户注册
	public String register(){
		userService.saveUser(user);
		ActionContext.getContext().getSession().remove("u");
		return SUCCESS;
	}
	//修改用户信息
	public String modifyUser(){
		Map session = ActionContext.getContext().getSession();
		if(session.get("a")!=null){
			userService.updateUser(user);
			return "userList";
		}
		userService.updateUser(user);
		session.remove("u");
		return SUCCESS;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
}
