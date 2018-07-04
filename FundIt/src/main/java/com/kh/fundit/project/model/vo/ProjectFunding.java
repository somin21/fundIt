package com.kh.fundit.project.model.vo;

import java.sql.Date;

public class ProjectFunding {
	
	private int projectNo;
	private int supportGoal;
	private Date deadlineDate;
	private Date calculateDueDate;
	private String refund;
	
	public ProjectFunding() {}
	
	public ProjectFunding(int projectNo, int supportGoal, Date deadlineDate, Date calculateDueDate, String refund) {
		super();
		this.projectNo = projectNo;
		this.supportGoal = supportGoal;
		this.deadlineDate = deadlineDate;
		this.calculateDueDate = calculateDueDate;
		this.refund = refund;
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

	public String getRefund() {
		return refund;
	}

	public void setRefund(String refund) {
		this.refund = refund;
	}

	@Override
	public String toString() {
		return "ProjectFunding [projectNo=" + projectNo + ", supportGoal=" + supportGoal + ", deadlineDate="
				+ deadlineDate + ", calculateDueDate=" + calculateDueDate + "]";
	}
	
	


}
