package org.efood.service.impl;

import java.util.List;

import org.efood.dao.AdminDAO;
import org.efood.dao.BaseDAO;
import org.efood.service.AdminService;
import org.efood.vo.Admin;

public class AdminServiceImpl extends BaseDAO implements AdminService{
	AdminDAO adminDAO;
	@Override
	public Admin validateAdmin(String adminname, String password) {
		return adminDAO.validateAdmin(adminname, password);
	}
	@Override
	public List<Admin> getAllAdmin() {
		return adminDAO.getAllAdmin();
	}
	@Override
	public void deleteAdmin(Integer adminid) {
		adminDAO.deleteAdmin(adminid);
	}
	@Override
	public void saveAdmin(Admin admin) {
		adminDAO.saveAdmin(admin);
	}
	@Override
	public Admin getAdminById(Integer adminid) {
		return adminDAO.getAdminById(adminid);
	}
	@Override
	public void updateAdmin(Admin admin) {
		adminDAO.updateAdmin(admin);
	}
	

	public AdminDAO getAdminDAO() {
		return adminDAO;
	}
	public void setAdminDAO(AdminDAO adminDAO) {
		this.adminDAO = adminDAO;
	}
	
}
