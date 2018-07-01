package com.kh.fundit.project.model.vo;

import java.sql.Date;

public class Community {
	private int projectNo;
	private int communityNo;
	private String email;
	private String communityContent;
	private Date communityDate;
	
	public Community() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Community(int projectNo, int communityNo, String email, String communityContent, Date communityDate) {
		super();
		this.projectNo = projectNo;
		this.communityNo = communityNo;
		this.email = email;
		this.communityContent = communityContent;
		this.communityDate = communityDate;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	public int getCommunityNo() {
		return communityNo;
	}

	public void setCommunityNo(int communityNo) {
		this.communityNo = communityNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCommunityContent() {
		return communityContent;
	}

	public void setCommunityContent(String communityContent) {
		this.communityContent = communityContent;
	}

	public Date getCommunityDate() {
		return communityDate;
	}

	public void setCommunityDate(Date communityDate) {
		this.communityDate = communityDate;
	}

	@Override
	public String toString() {
		return "[projectNo=" + projectNo + ", communityNo=" + communityNo + ", email=" + email
				+ ", communityContent=" + communityContent + ", communityDate=" + communityDate + "]";
	}
	
	
}
