package com.kh.fundit.admin.model.vo;

import java.sql.Date;

public class AdminProjectView {
	private int rowNum;
	private int projectNo;
	private String email;
	private String projectImage;
	private String projectTitle;
	private String name;
	private int supportGoal;
	private Date calculateduedDate;
	private String categoryCode;
	private String movie;
	private String story;
	public AdminProjectView() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AdminProjectView(int rowNum, int projectNo, String email, String projectImage, String projectTitle,
			String name, int supportGoal, Date calculateduedDate, String categoryCode, String movie, String story) {
		super();
		this.rowNum = rowNum;
		this.projectNo = projectNo;
		this.email = email;
		this.projectImage = projectImage;
		this.projectTitle = projectTitle;
		this.name = name;
		this.supportGoal = supportGoal;
		this.calculateduedDate = calculateduedDate;
		this.categoryCode = categoryCode;
		this.movie = movie;
		this.story = story;
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
	public String getCategoryCode() {
		return categoryCode;
	}
	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}
	public String getMovie() {
		return movie;
	}
	public void setMovie(String movie) {
		this.movie = movie;
	}
	public String getStory() {
		return story;
	}
	public void setStory(String story) {
		this.story = story;
	}
	@Override
	public String toString() {
		return "AdminprojectView [rowNum=" + rowNum + ", projectNo=" + projectNo + ", email=" + email
				+ ", projectImage=" + projectImage + ", projectTitle=" + projectTitle + ", name=" + name
				+ ", supportGoal=" + supportGoal + ", calculateduedDate=" + calculateduedDate + ", categoryCode="
				+ categoryCode + ", movie=" + movie + ", story=" + story + "]";
	}
	
	
}
