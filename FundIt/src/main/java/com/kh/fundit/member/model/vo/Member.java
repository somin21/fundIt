package com.kh.fundit.member.model.vo;

import java.sql.Date;

public class Member {

	private String Email;
	private String Password;
	private String Name;
	private String Newsyn;
	private String Adminyn;
	private Date enrollDate;
	private String Naveryn;
	
	
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getNewsyn() {
		return Newsyn;
	}
	public void setNewsyn(String newsyn) {
		Newsyn = newsyn;
	}
	public String getAdminyn() {
		return Adminyn;
	}
	public void setAdminyn(String adminyn) {
		Adminyn = adminyn;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	public String getNaveryn() {
		return Naveryn;
	}
	public void setNaveryn(String naveryn) {
		Naveryn = naveryn;
	}
	public Member(String email, String password, String name, String newsyn, String adminyn, Date enrollDate,
			String naveryn) {
		super();
		Email = email;
		Password = password;
		Name = name;
		Newsyn = newsyn;
		Adminyn = adminyn;
		this.enrollDate = enrollDate;
		Naveryn = naveryn;
	}
	@Override
	public String toString() {
		return "Member [Email=" + Email + ", Password=" + Password + ", Name=" + Name + ", Newsyn=" + Newsyn
				+ ", Adminyn=" + Adminyn + ", enrollDate=" + enrollDate + ", Naveryn=" + Naveryn + "]";
	}
	
	
	
	public Member() {}
	
}
