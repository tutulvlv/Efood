package org.efood.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.efood.service.CatalogService;
import org.efood.service.MenuService;
import org.efood.service.OrderService;
import org.efood.util.Paging;
import org.efood.util.Upload;
import org.efood.vo.Catalog;
import org.efood.vo.Menu;
import org.efood.vo.Orderitem;
import org.hibernate.loader.custom.Return;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class MenuAction extends ActionSupport{
	private CatalogService catalogService;
	private MenuService menuService;
	private OrderService orderService;
	private Upload upload;
	private Menu menu;
	public Catalog catalog;
	private int catalogid;
	private int currentPage=1;
	private int menuid;
	private String menuname;
	private double mixprice;
	private double maxprice;
	private List<File> img;
	private List<String> imgFileName;
	private List<String> imgContentType;
	//显示所有菜品分类
	public String showCatalog(){
		List<Catalog> lc=catalogService.getCataLogList();
		Map re=(Map)ActionContext.getContext().get("request");
		re.put("lc", lc);
		return NONE;
	}
	//显示随机的9个菜品
	public String showRandomMenu(){
		List<Menu> lm=menuService.getRandomMenuList();
		Map re=(Map)ActionContext.getContext().get("request");
		re.put("lm", lm);
		return NONE;
	}
	//按分类显示菜品
	public String showMenuByCatalog(){
		int total=menuService.getTotalByCatalog(catalogid);
		Paging pager=new Paging(currentPage,total);
		List<Menu> lm=menuService.
				getMenuByCatalog(catalogid, currentPage, pager.getPageSize());
		Map re=(Map)ActionContext.getContext().get("request");
		re.put("lm", lm);
		re.put("pager",pager);
		Map session=ActionContext.getContext().getSession();
		return SUCCESS;
	}
	//通过名字查询菜品
	public String getMenuByName(){
		List<Menu> lm=menuService.getMenuByName(menuname);
		System.out.println(menuname);
		Map re=(Map)ActionContext.getContext().get("request");
		re.put("lm", lm);
		return SUCCESS;
	}
	
	//通过名字查询菜品
	public String AutoComplete() throws IOException{
		List<Menu> lm=menuService.getMenuByName(menuname);
		if(lm.size()==0){
			return null;
		}
		StringBuffer menuname=new StringBuffer();
		for (Menu menu : lm) {
			menuname.append(menu.getMenuname()+",");
		}
		menuname.deleteCharAt(menuname.length()-1);
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter writer = response.getWriter();
		writer.print(menuname);
		System.out.println(menuname);
		return null;
	}
	
	//通过价格区间查询菜品
	public String getMenuByPrice(){
		List<Menu> lm=menuService.getMenuByPrice(mixprice,maxprice);
		Map re=(Map)ActionContext.getContext().get("request");
		re.put("lm", lm);
		return SUCCESS;
	}
	//显示菜品详情
	public String showMenuDetail(){
		Map session = ActionContext.getContext().getSession();
		if(session.get("a")!=null){
			List<Catalog> lc=catalogService.getCataLogList();
			Menu menu = menuService.getMenuById(menuid);
			Map re=(Map)ActionContext.getContext().get("request");
			re.put("m", menu);
			re.put("lc", lc);
			return "menuList";
		}
		List<Orderitem> commentlist = orderService.getCommentByMenuid(menuid);
		Menu menu = menuService.getMenuById(menuid);
		Map re=(Map)ActionContext.getContext().get("request");
		re.put("menu", menu);
		re.put("commentlist", commentlist);
		return SUCCESS;
	}
	//显示所有菜品列表
	public String showAllMenu(){
		int total=menuService.getTotalMenu();
		Paging pager=new Paging(currentPage,total);
		List<Menu> lm=menuService.getAllMenu(currentPage, pager.getPageSize());
		Map re=(Map)ActionContext.getContext().get("request");
		re.put("lm", lm);
		re.put("pager",pager);
		return SUCCESS;
	}
	//删除菜品
	public String deleteMenu(){
		menuService.deleteMenu(menuid);
		return SUCCESS;
	}
	//修改菜品
	public String modifyMenu() throws IOException{
		if(img!=null){
			upload.uploadImage(img, imgFileName, menu);
		}
		menuService.updateMenu(menu);
		return SUCCESS;
	}
	//添加菜品
	public String addMenu() throws IOException{
		if(img!=null){
			upload.uploadImage(img, imgFileName, menu);
		}
		menuService.saveMenu(menu);
		return SUCCESS;
	}
	//添加菜品分类
	public String addCatalog(){
		catalogService.saveCatalog(catalog);
		return SUCCESS;
	}
	//修改菜品分类
	public String modifyCatalog(){
		catalogService.updateCatalog(catalog);
		return SUCCESS;
	}
	//删除菜品分类
	public String deleteCatalog(){
		catalogService.deleteCatalog(catalogid);
		return SUCCESS;
	}
	
	public int getCatalogid() {
		return catalogid;
	}
	public void setCatalogid(int catalogid) {
		this.catalogid = catalogid;
	}
	public CatalogService getCatalogService() {
		return catalogService;
	}
	public void setCatalogService(CatalogService catalogService) {
		this.catalogService = catalogService;
	}
	public MenuService getMenuService() {
		return menuService;
	}
	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public OrderService getOrderService() {
		return orderService;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public int getMenuid() {
		return menuid;
	}
	public void setMenuid(int menuid) {
		this.menuid = menuid;
	}
	public Menu getMenu() {
		return menu;
	}
	public void setMenu(Menu menu) {
		this.menu = menu;
	}
	public Upload getUpload() {
		return upload;
	}
	public void setUpload(Upload upload) {
		this.upload = upload;
	}
	public List<File> getImg() {
		return img;
	}
	public void setImg(List<File> img) {
		this.img = img;
	}
	public List<String> getImgFileName() {
		return imgFileName;
	}
	public void setImgFileName(List<String> imgFileName) {
		this.imgFileName = imgFileName;
	}
	public List<String> getImgContentType() {
		return imgContentType;
	}
	public void setImgContentType(List<String> imgContentType) {
		this.imgContentType = imgContentType;
	}
	public Catalog getCatalog() {
		return catalog;
	}
	public void setCatalog(Catalog catalog) {
		this.catalog = catalog;
	}
	public String getMenuname() {
		return menuname;
	}
	public void setMenuname(String menuname) {
		this.menuname = menuname;
	}
	public double getMixprice() {
		return mixprice;
	}
	public void setMixprice(double mixprice) {
		this.mixprice = mixprice;
	}
	public double getMaxprice() {
		return maxprice;
	}
	public void setMaxprice(double maxprice) {
		this.maxprice = maxprice;
	}
	
}
