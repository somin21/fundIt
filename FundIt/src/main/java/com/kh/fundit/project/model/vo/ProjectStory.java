package com.kh.fundit.project.model.vo;

public class ProjectStory {
	
	private int projectNo;
	private String introduceMovie;
	private String projectStory;
	
	public ProjectStory() {}
	
	public ProjectStory(int projectNo, String introduceMovie, String projectStory) {
		this.projectNo = projectNo;
		this.introduceMovie = introduceMovie;
		this.projectStory = projectStory;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
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

	@Override
	public String toString() {
		return "ProjectStory [projectNo=" + projectNo + ", introduceMovie=" + introduceMovie + ", projectStory="
				+ projectStory + "]";
	}

}
