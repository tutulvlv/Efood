package org.efood.service;

import java.util.List;

import org.efood.vo.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public interface UserService {
	public User validateUser(String username,String password);
	public void saveUser(User u);
	public void updateUser(User u);
	public List<User> getAllUser();
	public User getUserById(Integer id);
	public void deleteUser(Integer id);
}
