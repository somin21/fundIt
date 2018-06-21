package com.kh.fundit.project.model.vo;

public class Profile {
	private String email;
	private String profileImage;
	private String profileIntroduce;
	private String localCode;
	private String phone;
	
	public Profile() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Profile(String email, String profileImage, String profileIntroduce, String localCode, String phone) {
		super();
		this.email = email;
		this.profileImage = profileImage;
		this.profileIntroduce = profileIntroduce;
		this.localCode = localCode;
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}

	public String getProfileIntroduce() {
		return profileIntroduce;
	}

	public void setProfileIntroduce(String profileIntroduce) {
		this.profileIntroduce = profileIntroduce;
	}

	public String getLocalCode() {
		return localCode;
	}

	public void setLocalCode(String localCode) {
		this.localCode = localCode;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "[email=" + email + ", profileImage=" + profileImage + ", profileIntroduce=" + profileIntroduce
				+ ", localCode=" + localCode + ", phone=" + phone + "]";
	}
	
	
}
