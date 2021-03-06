package com.kh.fundit.member.model.vo;

import java.sql.Date;

public class Member {
	private String email;
	private String password;
	private String name;
	private String newsyn;
	private String adminyn;
	private Date enrollDate;
	private String naveryn;
	private String deleteyn;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNewsyn() {
		return newsyn;
	}
	public void setNewsyn(String newsyn) {
		this.newsyn = newsyn;
	}
	public String getAdminyn() {
		return adminyn;
	}
	public void setAdminyn(String adminyn) {
		this.adminyn = adminyn;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	public String getNaveryn() {
		return naveryn;
	}
	public void setNaveryn(String naveryn) {
		this.naveryn = naveryn;
	}
	public String getDeleteyn() {
		return deleteyn;
	}
	public void setDeleteyn(String deleteyn) {
		this.deleteyn = deleteyn;
	}
	@Override
	public String toString() {
		return "Member [email=" + email + ", password=" + password + ", name=" + name + ", newsyn=" + newsyn
				+ ", adminyn=" + adminyn + ", enrollDate=" + enrollDate + ", naveryn=" + naveryn + ", deleteyn="
				+ deleteyn + "]";
	}
	public Member(String email, String password, String name, String newsyn, String adminyn, Date enrollDate,
			String naveryn, String deleteyn) {
		super();
		this.email = email;
		this.password = password;
		this.name = name;
		this.newsyn = newsyn;
		this.adminyn = adminyn;
		this.enrollDate = enrollDate;
		this.naveryn = naveryn;
		this.deleteyn = deleteyn;
	}
	

   public Member(String email, String newsyn) {
		super();
		this.email = email;
		this.newsyn = newsyn;
	}
public Member() {}
   
}
