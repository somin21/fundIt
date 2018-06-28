package com.kh.fundit.project.model.vo;

import java.sql.Date;

public class ProjectDelivery {
	private int supportNo;
	private String email;
	private int projectNo;
	private String address;
	private Date deliverydueDate;
	private String postNum;
	
	public ProjectDelivery() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProjectDelivery(int supportNo, String email, int projectNo, String address, Date deliverydueDate,
			String postNum) {
		super();
		this.supportNo = supportNo;
		this.email = email;
		this.projectNo = projectNo;
		this.address = address;
		this.deliverydueDate = deliverydueDate;
		this.postNum = postNum;
	}

	public int getSupportNo() {
		return supportNo;
	}

	public void setSupportNo(int supportNo) {
		this.supportNo = supportNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getDeliverydueDate() {
		return deliverydueDate;
	}

	public void setDeliverydueDate(Date deliverydueDate) {
		this.deliverydueDate = deliverydueDate;
	}

	public String getPostNum() {
		return postNum;
	}

	public void setPostNum(String postNum) {
		this.postNum = postNum;
	}

	@Override
	public String toString() {
		return "[supportNo=" + supportNo + ", email=" + email + ", projectNo=" + projectNo
				+ ", address=" + address + ", deliverydueDate=" + deliverydueDate + ", postNum=" + postNum + "]";
	}
	
	
}
