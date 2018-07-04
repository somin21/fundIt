package com.kh.fundit.project.model.vo;

public class SupportPayment {
	private int supportNo;
	private String email;
	private int projectNo;
	private int minMoney;
	private int addMoney;
	private String payyn;
	private String payNo;
	private String payMoney;
	private String email_1;
	private String payway;
	private int supportNo_1;
	private String payCode;
	
	public SupportPayment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SupportPayment(int supportNo, String email, int projectNo, int minMoney, int addMoney, String payyn,
			String payNo, String payMoney, String email_1, String payway, int supportNo_1, String payCode) {
		super();
		this.supportNo = supportNo;
		this.email = email;
		this.projectNo = projectNo;
		this.minMoney = minMoney;
		this.addMoney = addMoney;
		this.payyn = payyn;
		this.payNo = payNo;
		this.payMoney = payMoney;
		this.email_1 = email_1;
		this.payway = payway;
		this.supportNo_1 = supportNo_1;
		this.payCode = payCode;
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

	public String getPayNo() {
		return payNo;
	}

	public void setPayNo(String payNo) {
		this.payNo = payNo;
	}

	public String getPayMoney() {
		return payMoney;
	}

	public void setPayMoney(String payMoney) {
		this.payMoney = payMoney;
	}

	public String getEmail_1() {
		return email_1;
	}

	public void setEmail_1(String email_1) {
		this.email_1 = email_1;
	}

	public String getPayway() {
		return payway;
	}

	public void setPayway(String payway) {
		this.payway = payway;
	}

	public int getSupportNo_1() {
		return supportNo_1;
	}

	public void setSupportNo_1(int supportNo_1) {
		this.supportNo_1 = supportNo_1;
	}

	public String getPayCode() {
		return payCode;
	}

	public void setPayCode(String payCode) {
		this.payCode = payCode;
	}

	@Override
	public String toString() {
		return "[supportNo=" + supportNo + ", email=" + email + ", projectNo=" + projectNo
				+ ", minMoney=" + minMoney + ", addMoney=" + addMoney + ", payyn=" + payyn + ", payNo=" + payNo
				+ ", payMoney=" + payMoney + ", email_1=" + email_1 + ", payway=" + payway + ", supportNo_1="
				+ supportNo_1 + ", payCode=" + payCode + "]";
	}
	
	
}
