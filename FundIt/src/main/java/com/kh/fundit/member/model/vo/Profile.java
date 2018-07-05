
package com.kh.fundit.member.model.vo;

public class Profile {
	private String email;
	private String profileImage;
	private String profileIntroduce;
	private String localCode;
	private String localName;
	private String phone;
	
	private String name;
	
	
	public Profile() {}


	public Profile(String email, String profileImage, String profileIntroduce, String localCode, String localName,String phone) {
		this.email = email;
		this.profileImage = profileImage;
		this.profileIntroduce = profileIntroduce;
		this.localCode = localCode;
		this.localName = localName;
		this.phone = phone;
	}


	public Profile(String email, String renamedFileName, String localCode, String profileIntroduce, String phone) {
		this.email = email;
		this.profileImage = renamedFileName;
		this.localCode = localCode;
		this.profileIntroduce = profileIntroduce;
		this.phone = phone;
	}


	public Profile(String email, String profileImage, String profileIntroduce, String localCode, String localName,
			String phone, String name) {
		super();
		this.email = email;
		this.profileImage = profileImage;
		this.profileIntroduce = profileIntroduce;
		this.localCode = localCode;
		this.localName = localName;
		this.phone = phone;
		this.name = name;
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


	public String getLocalName() {
		return localName;
	}


	public void setLocalName(String localName) {
		this.localName = localName;
	}

	
	
	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	@Override
	public String toString() {
		return "Profile [email=" + email + ", profileImage=" + profileImage + ", profileIntroduce=" + profileIntroduce
				+ ", localCode=" + localCode + ", localName=" + localName + ", phone=" + phone + "]";
	}



	
}
