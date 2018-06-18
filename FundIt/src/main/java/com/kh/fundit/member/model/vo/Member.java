package com.kh.fundit.member.model.vo;

import java.sql.Date;

public class Member {
	private String email;
	private String password;
	private String name;
	private char newsYn;
	private char adminYn;
	private Date enrollDate;
	private char naverYn;
	
	public Member() {}

	public Member(String email, String password, String name, char newsYn, char adminYn, Date enrollDate,
			char naverYn) {
		
		this.email = email;
		this.password = password;
		this.name = name;
		this.newsYn = newsYn;
		this.adminYn = adminYn;
		this.enrollDate = enrollDate;
		this.naverYn = naverYn;
	}

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

	public char getNewsYn() {
		return newsYn;
	}

	public void setNewsYn(char newsYn) {
		this.newsYn = newsYn;
	}

	public char getAdminYn() {
		return adminYn;
	}

	public void setAdminYn(char adminYn) {
		this.adminYn = adminYn;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public char getNaverYn() {
		return naverYn;
	}

	public void setNaverYn(char naverYn) {
		this.naverYn = naverYn;
	}

	@Override
	public String toString() {
		return "Member [email=" + email + ", password=" + password + ", name=" + name + ", newsYn=" + newsYn
				+ ", adminYn=" + adminYn + ", enrollDate=" + enrollDate + ", naverYn=" + naverYn + "]";
	}
	
	
	
	
	

}
