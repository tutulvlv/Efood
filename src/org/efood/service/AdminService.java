package org.efood.service;

import java.util.List;

import org.efood.vo.Admin;

public interface AdminService {
	public Admin validateAdmin(String adminname,String password);
	public List<Admin> getAllAdmin();
	public void deleteAdmin(Integer adminid);
	public void saveAdmin(Admin admin);
	public Admin getAdminById(Integer adminid);
	public void updateAdmin(Admin admin);
}
