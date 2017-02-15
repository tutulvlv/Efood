package org.efood.vo;

import java.sql.Timestamp;
import java.util.Date;

/**
 * Admin entity. @author MyEclipse Persistence Tools
 */

public class Admin implements java.io.Serializable {

	// Fields

	private Integer adminid;
	private String adminname;
	private String password;
	private String telephone;
	private Date lasttime;

	// Constructors

	/** default constructor */
	public Admin() {
	}
	
	
	public Admin(String adminname, String password, String telephone,
			Timestamp lasttime) {
		super();
		this.adminname = adminname;
		this.password = password;
		this.telephone = telephone;
		this.lasttime = lasttime;
	}


	public Integer getAdminid() {
		return adminid;
	}

	public void setAdminid(Integer adminid) {
		this.adminid = adminid;
	}

	public String getAdminname() {
		return adminname;
	}

	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public Date getLasttime() {
		return lasttime;
	}

	public void setLasttime(Date lasttime) {
		this.lasttime = lasttime;
	}

	
}