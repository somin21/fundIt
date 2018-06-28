package com.kh.fundit.admin.model.vo;

public class AdminMember {
	private String email;
	private int projecting;
	private int supporting;
	
	public AdminMember() {}

	public AdminMember(String email, int projecting, int supporting) {
		super();
		this.email = email;
		this.projecting = projecting;
		this.supporting = supporting;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getProjecting() {
		return projecting;
	}

	public void setProjecting(int projecting) {
		this.projecting = projecting;
	}

	public int getSupporting() {
		return supporting;
	}

	public void setSupporting(int supporting) {
		this.supporting = supporting;
	}

	@Override
	public String toString() {
		return "AdminMember [email=" + email + ", projecting=" + projecting + ", supporting=" + supporting + "]";
	}
	
	
	
}
