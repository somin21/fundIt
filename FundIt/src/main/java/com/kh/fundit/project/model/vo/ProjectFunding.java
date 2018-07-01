package com.kh.fundit.project.model.vo;

import java.sql.Date;

public class ProjectFunding {
	
	private int projectNo;
	private int supportGoal;
	private Date deadlineDate;
	private Date calculateDueDate;
	
	public ProjectFunding() {}
	
	public ProjectFunding(int projectNo, int supportGoal, Date deadlineDate, Date calculateDueDate) {
		this.projectNo = projectNo;
		this.supportGoal = supportGoal;
		this.deadlineDate = deadlineDate;
		this.calculateDueDate = calculateDueDate;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	public int getSupportGoal() {
		return supportGoal;
	}

	public void setSupportGoal(int supportGoal) {
		this.supportGoal = supportGoal;
	}

	public Date getDeadlineDate() {
		return deadlineDate;
	}

	public void setDeadlineDate(Date deadlineDate) {
		this.deadlineDate = deadlineDate;
	}

	public Date getCalculateDueDate() {
		return calculateDueDate;
	}

	public void setCalculateDueDate(Date calculateDueDate) {
		this.calculateDueDate = calculateDueDate;
	}

	@Override
	public String toString() {
		return "ProjectFunding [projectNo=" + projectNo + ", supportGoal=" + supportGoal + ", deadlineDate="
				+ deadlineDate + ", calculateDueDate=" + calculateDueDate + "]";
	}
	
	


}
