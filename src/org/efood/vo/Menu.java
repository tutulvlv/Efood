package org.efood.vo;

/**
 * Menu entity. @author MyEclipse Persistence Tools
 */

public class Menu implements java.io.Serializable {

	// Fields

	private Integer menuid;
	private String menuname;
	private String descr;
	private String image;
	private Double price;
	private Catalog catalog;

	// Constructors

	/** default constructor */
	public Menu() {
	}

	public Menu(String menuname, String descr, String image, Double price,
			Catalog catalog) {
		super();
		this.menuname = menuname;
		this.descr = descr;
		this.image = image;
		this.price = price;
		this.catalog = catalog;
	}

	public Integer getMenuid() {
		return menuid;
	}

	public void setMenuid(Integer menuid) {
		this.menuid = menuid;
	}

	public String getMenuname() {
		return menuname;
	}

	public void setMenuname(String menuname) {
		this.menuname = menuname;
	}

	public String getDescr() {
		return descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Catalog getCatalog() {
		return catalog;
	}

	public void setCatalog(Catalog catalog) {
		this.catalog = catalog;
	}
	
	
}