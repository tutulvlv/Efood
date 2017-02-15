package org.efood.service.impl;

import java.util.List;

import org.efood.dao.UserDAO;
import org.efood.vo.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class UserServiceImpl implements org.efood.service.UserService {
	private UserDAO userDAO;
	@Override
	public User validateUser(String username, String password) {
		return userDAO.validateUser(username, password);
	}
	@Override
	public void updateUser(User u) {
		userDAO.updateUser(u);
	}
	@Override
	public void saveUser(User u) {
		userDAO.saveUser(u);
	}
	@Override
	public List<User> getAllUser() {
		return userDAO.getAllUser();
	}
	@Override
	public User getUserById(Integer id) {
		return userDAO.getUserById(id);
	}
	@Override
	public void deleteUser(Integer id) {
		userDAO.deleteUser(id);
	}

	public UserDAO getUserDAO() {
		return userDAO;
	}
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
}
