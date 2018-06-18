package com.kh.fundit.project.model.vo;

public class ListProjectView {
	
	private int projectNo;
	private String projectTitle;
	private String projectImage;
	private String name;
	private int deadlineDay;
	private int supportMoney;
	private int supportPercent;
	
	
	public ListProjectView() {}

	public ListProjectView(int projectNo, String projectTitle, String projectImage, String name, int deadlineDay,
			int supportMoney, int supportPercent) {
		this.projectNo = projectNo;
		this.projectTitle = projectTitle;
		this.projectImage = projectImage;
		this.name = name;
		this.deadlineDay = deadlineDay;
		this.supportMoney = supportMoney;
		this.supportPercent = supportPercent;
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

	@Override
	public String toString() {
		return "ListProjectView [projectNo=" + projectNo + ", projectTitle=" + projectTitle + ", projectImage="
				+ projectImage + ", name=" + name + ", deadlineDay=" + deadlineDay + ", supportMoney=" + supportMoney
				+ ", supportPercent=" + supportPercent + "]";
	}

}
