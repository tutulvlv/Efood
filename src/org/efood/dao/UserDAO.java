package org.efood.dao;

import java.util.List;

import org.efood.vo.User;

public interface UserDAO {
	public User validateUser(String username,String password);
	public void saveUser(User user);
	public void updateUser(User user);
	public List<User> getAllUser();
	public User getUserById(Integer id);
	public void deleteUser(Integer id);
}
