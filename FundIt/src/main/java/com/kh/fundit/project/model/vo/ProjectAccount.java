package com.kh.fundit.project.model.vo;

public class ProjectAccount {
	
	private int projectNo;
	private String email;
	private String phone;
	private String accountName;
	private String accountNumber;
	private String accountType;
	private String bankCode;
	
	private String bankName;
	
	public ProjectAccount() {}
	
	public ProjectAccount(int projectNo, String email, String phone, String accountName, String accountNumber,
			String accountType, String bankCode) {
		this.projectNo = projectNo;
		this.email = email;
		this.phone = phone;
		this.accountName = accountName;
		this.accountNumber = accountNumber;
		this.accountType = accountType;
		this.bankCode = bankCode;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public String getAccountType() {
		return accountType;
	}
	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}
	public String getBankCode() {
		return bankCode;
	}
	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}
	
	
	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	@Override
	public String toString() {
		return "ProjectAccount [projectNo=" + projectNo + ", email=" + email + ", phone=" + phone + ", accountName="
				+ accountName + ", accountNumber=" + accountNumber + ", accountType=" + accountType + ", bankCode="
				+ bankCode + "]";
	}

}
