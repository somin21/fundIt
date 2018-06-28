package com.kh.fundit.project.model.vo;

public class ProjectSupport {
	private int supportNo;
	private String email;
	private int projectNo;
	private int minMoney;
	private int addMoney;
	private String payyn;
	
	public ProjectSupport() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProjectSupport(int supportNo, String email, int projectNo, int minMoney, int addMoney, String payyn) {
		super();
		this.supportNo = supportNo;
		this.email = email;
		this.projectNo = projectNo;
		this.minMoney = minMoney;
		this.addMoney = addMoney;
		this.payyn = payyn;
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

	public int getMinMoney() {
		return minMoney;
	}

	public void setMinMoney(int minMoney) {
		this.minMoney = minMoney;
	}

	public int getAddMoney() {
		return addMoney;
	}

	public void setAddMoney(int addMoney) {
		this.addMoney = addMoney;
	}

	public String getPayyn() {
		return payyn;
	}

	public void setPayyn(String payyn) {
		this.payyn = payyn;
	}

	@Override
	public String toString() {
		return "[supportNo=" + supportNo + ", email=" + email + ", projectNo=" + projectNo
				+ ", minMoney=" + minMoney + ", addMoney=" + addMoney + ", payyn=" + payyn + "]";
	}
	
	
	
}
