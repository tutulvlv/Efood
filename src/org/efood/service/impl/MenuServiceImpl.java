package org.efood.service.impl;

import java.util.List;

import org.efood.dao.MenuDAO;
import org.efood.service.MenuService;
import org.efood.vo.Menu;

public class MenuServiceImpl implements MenuService {
	MenuDAO menuDAO;
	@Override
	public List<Menu> getRandomMenuList() {
		return menuDAO.getRandomMenuList();
	}
	@Override
	public List<Menu> getMenuByCatalog(Integer catalogid,int currentPage,int pageSize) {
		return menuDAO.getMenuListByCatalog(catalogid, currentPage, pageSize);
	}
	@Override
	public int getTotalByCatalog(Integer catalogid) {
		return menuDAO.getTotalByCatalog(catalogid);
	}
	@Override
	public Menu getMenuById(Integer menuid) {
		return menuDAO.getMenuById(menuid);
	}
	@Override
	public List<Menu> getAllMenu(int currentPage, int pageSize) {
		return menuDAO.getAllMenu(currentPage, pageSize);
	}
	@Override
	public int getTotalMenu() {
		return menuDAO.getTotalMenu();
	}
	@Override
	public void deleteMenu(Integer menuid) {
		menuDAO.deleteMenu(menuid);
	}
	@Override
	public void updateMenu(Menu menu) {
		menuDAO.updateMenu(menu);
	}
	@Override
	public void saveMenu(Menu menu) {
		menuDAO.saveMenu(menu);
	}
	@Override
	public List<Menu> getMenuByName(String menuname) {
		return menuDAO.getMenuByName(menuname);
	}
	@Override
	public List<Menu> getMenuByPrice(double mixprice, double maxprice) {
		return menuDAO.getMenuByPrice(mixprice, maxprice);
	}
	
	public MenuDAO getMenuDAO() {
		return menuDAO;
	}
	public void setMenuDAO(MenuDAO menuDAO) {
		this.menuDAO = menuDAO;
	}
	

}
