package com.kh.fundit.project.model.vo;

import java.sql.Date;

public class ProjectList {
	private int projectNo;
	private String projectTitle;
	private String projectImage;
	private String name;
	private int deadlineDay;
	private int supportMoney;
	private int supportPercent;
	private int supportor;
	private Date projectDate;
	
	public ProjectList() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProjectList(int projectNo, String projectTitle, String projectImage, String name, int deadlineDay,
			int supportMoney, int supportPercent, int supportor, Date projectDate) {
		super();
		this.projectNo = projectNo;
		this.projectTitle = projectTitle;
		this.projectImage = projectImage;
		this.name = name;
		this.deadlineDay = deadlineDay;
		this.supportMoney = supportMoney;
		this.supportPercent = supportPercent;
		this.supportor = supportor;
		this.projectDate = projectDate;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	public String getProjectTitle() {
		return projectTitle;
	}

	public void setProjectTitle(String projectTitle) {
		this.projectTitle = projectTitle;
	}

	public String getProjectImage() {
		return projectImage;
	}

	public void setProjectImage(String projectImage) {
		this.projectImage = projectImage;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getDeadlineDay() {
		return deadlineDay;
	}

	public void setDeadlineDay(int deadlineDay) {
		this.deadlineDay = deadlineDay;
	}

	public int getSupportMoney() {
		return supportMoney;
	}

	public void setSupportMoney(int supportMoney) {
		this.supportMoney = supportMoney;
	}

	public int getSupportPercent() {
		return supportPercent;
	}

	public void setSupportPercent(int supportPercent) {
		this.supportPercent = supportPercent;
	}

	public int getSupportor() {
		return supportor;
	}

	public void setSupportor(int supportor) {
		this.supportor = supportor;
	}

	public Date getProjectDate() {
		return projectDate;
	}

	public void setProjectDate(Date projectDate) {
		this.projectDate = projectDate;
	}

	@Override
	public String toString() {
		return "[projectNo=" + projectNo + ", projectTitle=" + projectTitle + ", projectImage="
				+ projectImage + ", name=" + name + ", deadlineDay=" + deadlineDay + ", supportMoney=" + supportMoney
				+ ", supportPercent=" + supportPercent + ", supportor=" + supportor + ", projectDate=" + projectDate
				+ "]";
	}
	
	
}
