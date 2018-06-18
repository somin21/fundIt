package com.kh.fundit.project.model.vo;

import java.sql.Date;

public class ProjectOutline {
	
	private int projectNo;
	private String email;
	private String projectTitle;
	private String projectImage;
	private String projectSummary;
	private String categoryCode;
	private Date projectDate;
	private String projectConfirmYN;
	private String projectIndexYN;
	
	public ProjectOutline() {}

	public ProjectOutline(int projectNo, String email, String projectTitle, String projectImage, String projectSummary,
			String categoryCode, Date projectDate, String projectConfirmYN, String projectIndexYN) {
		this.projectNo = projectNo;
		this.email = email;
		this.projectTitle = projectTitle;
		this.projectImage = projectImage;
		this.projectSummary = projectSummary;
		this.categoryCode = categoryCode;
		this.projectDate = projectDate;
		this.projectConfirmYN = projectConfirmYN;
		this.projectIndexYN = projectIndexYN;
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

	public String getProjectSummary() {
		return projectSummary;
	}

	public void setProjectSummary(String projectSummary) {
		this.projectSummary = projectSummary;
	}

	public String getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}

	public Date getProjectDate() {
		return projectDate;
	}

	public void setProjectDate(Date projectDate) {
		this.projectDate = projectDate;
	}

	public String getProjectConfirmYN() {
		return projectConfirmYN;
	}

	public void setProjectConfirmYN(String projectConfirmYN) {
		this.projectConfirmYN = projectConfirmYN;
	}

	public String getProjectIndexYN() {
		return projectIndexYN;
	}

	public void setProjectIndexYN(String projectIndexYN) {
		this.projectIndexYN = projectIndexYN;
	}

	@Override
	public String toString() {
		return "ProjectOutline [projectNo=" + projectNo + ", email=" + email + ", projectTitle=" + projectTitle
				+ ", projectImage=" + projectImage + ", projectSummary=" + projectSummary + ", categoryCode="
				+ categoryCode + ", projectDate=" + projectDate + ", projectConfirmYN=" + projectConfirmYN
				+ ", projectIndexYN=" + projectIndexYN + "]";
	}
	
	
	
	

}
