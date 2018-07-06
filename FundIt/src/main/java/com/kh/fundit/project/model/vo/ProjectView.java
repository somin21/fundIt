package com.kh.fundit.project.model.vo;

import java.sql.Date;

public class ProjectView {
	private int rowNum;
	private int projectNo;
	private String email;
	private String projectImage;
	private String projectTitle;
	private String name;
	private int deadlineDay;
	private int supportGoal;
	private Date calculateduedDate;
	private int supportMoney;
	private int supportPercent;
	private int supportor;
	private String categoryCode;
	private String refund;
	
	private Date deadlineDate;
	private String categoryName;
	private String introduceMovie;
	private String projectStory;
	
	public ProjectView() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProjectView(int rowNum, int projectNo, String email, String projectImage, String projectTitle, String name,
			int deadlineDay, int supportGoal, Date calculateduedDate, int supportMoney, int supportPercent,
			int supportor, String categoryCode, String refund) {
		super();
		this.rowNum = rowNum;
		this.projectNo = projectNo;
		this.email = email;
		this.projectImage = projectImage;
		this.projectTitle = projectTitle;
		this.name = name;
		this.deadlineDay = deadlineDay;
		this.supportGoal = supportGoal;
		this.calculateduedDate = calculateduedDate;
		this.supportMoney = supportMoney;
		this.supportPercent = supportPercent;
		this.supportor = supportor;
		this.categoryCode = categoryCode;
		this.refund = refund;
	}

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getProjectImage() {
		return projectImage;
	}

	public void setProjectImage(String projectImage) {
		this.projectImage = projectImage;
	}

	public String getProjectTitle() {
		return projectTitle;
	}

	public void setProjectTitle(String projectTitle) {
		this.projectTitle = projectTitle;
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

	public int getSupportGoal() {
		return supportGoal;
	}

	public void setSupportGoal(int supportGoal) {
		this.supportGoal = supportGoal;
	}

	public Date getCalculateduedDate() {
		return calculateduedDate;
	}

	public void setCalculateduedDate(Date calculateduedDate) {
		this.calculateduedDate = calculateduedDate;
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

	public String getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}

	public String getRefund() {
		return refund;
	}

	public void setRefund(String refund) {
		this.refund = refund;
	}
	
	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getIntroduceMovie() {
		return introduceMovie;
	}

	public void setIntroduceMovie(String introduceMovie) {
		this.introduceMovie = introduceMovie;
	}

	public String getProjectStory() {
		return projectStory;
	}

	public void setProjectStory(String projectStory) {
		this.projectStory = projectStory;
	}
	
	public Date getDeadlineDate() {
		return deadlineDate;
	}

	public void setDeadlineDate(Date deadlineDate) {
		this.deadlineDate = deadlineDate;
	}

	@Override
	public String toString() {
		return "ProjectView [rowNum=" + rowNum + ", projectNo=" + projectNo + ", email=" + email + ", projectImage="
				+ projectImage + ", projectTitle=" + projectTitle + ", name=" + name + ", deadlineDay=" + deadlineDay
				+ ", supportGoal=" + supportGoal + ", calculateduedDate=" + calculateduedDate + ", supportMoney="
				+ supportMoney + ", supportPercent=" + supportPercent + ", supportor=" + supportor + ", categoryCode="
				+ categoryCode + ", refund=" + refund + ", introduceMovie=" + introduceMovie + ", projectStory="
				+ projectStory + "]";
	}
	
	
	
}
