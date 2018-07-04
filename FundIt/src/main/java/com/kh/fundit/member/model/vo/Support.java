package com.kh.fundit.member.model.vo;

import java.sql.Date;

public class Support {
	private int projectNo;
	private int supportNo;
	private String payYn;
	private int mySupportMoney;
	private int supportGoal;
	private int deadlineDate;
	private String projectWriter;
	private String projectTitle;//
	private String projectImage;
	private int supportPercent;
	private String itemName;
	
	
	public Support() {
		
	}

	public Support(int projectNo, int supportNo, int mySupportMoney, int supportGoal, int deadlineDate,
			String projectWriter, String projectTitle, String projectImage, int supportPercent, String itemName) {
		
		this.projectNo = projectNo;
		this.supportNo = supportNo;
		this.mySupportMoney = mySupportMoney;
		this.supportGoal = supportGoal;
		this.deadlineDate = deadlineDate;
		this.projectWriter = projectWriter;
		this.projectTitle = projectTitle;
		this.projectImage = projectImage;
		this.supportPercent = supportPercent;
		this.itemName = itemName;
	}
	
	

	public Support(int projectNo, int supportNo, String payYn, int mySupportMoney, int supportGoal, int deadlineDate,
			String projectWriter, String projectTitle, String projectImage, int supportPercent, String itemName) {
		super();
		this.projectNo = projectNo;
		this.supportNo = supportNo;
		this.payYn = payYn;
		this.mySupportMoney = mySupportMoney;
		this.supportGoal = supportGoal;
		this.deadlineDate = deadlineDate;
		this.projectWriter = projectWriter;
		this.projectTitle = projectTitle;
		this.projectImage = projectImage;
		this.supportPercent = supportPercent;
		this.itemName = itemName;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	public int getSupportNo() {
		return supportNo;
	}

	public void setSupportNo(int supportNo) {
		this.supportNo = supportNo;
	}
	
	public String getPayYn() {
		return payYn;
	}

	public void setPayYn(String payYn) {
		this.payYn = payYn;
	}

	public int getMySupportMoney() {
		return mySupportMoney;
	}

	public void setMySupportMoney(int mySupportMoney) {
		this.mySupportMoney = mySupportMoney;
	}

	public int getSupportGoal() {
		return supportGoal;
	}

	public void setSupportGoal(int supportGoal) {
		this.supportGoal = supportGoal;
	}

	public int getDeadlineDate() {
		return deadlineDate;
	}

	public void setDeadlineDate(int deadlineDate) {
		this.deadlineDate = deadlineDate;
	}

	public String getProjectWriter() {
		return projectWriter;
	}

	public void setProjectWriter(String projectWriter) {
		this.projectWriter = projectWriter;
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

	public int getSupportPercent() {
		return supportPercent;
	}

	public void setSupportPercent(int supportPercent) {
		this.supportPercent = supportPercent;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	@Override
	public String toString() {
		return "Support [projectNo=" + projectNo + ", supportNo=" + supportNo + ", payYn=" + payYn + ", mySupportMoney="
				+ mySupportMoney + ", supportGoal=" + supportGoal + ", deadlineDate=" + deadlineDate
				+ ", projectWriter=" + projectWriter + ", projectTitle=" + projectTitle + ", projectImage="
				+ projectImage + ", supportPercent=" + supportPercent + ", itemName=" + itemName + "]";
	}

	
	
	
	
	
	
	

}
