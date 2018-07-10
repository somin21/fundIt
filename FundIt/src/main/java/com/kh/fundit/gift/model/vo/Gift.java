package com.kh.fundit.gift.model.vo;

import java.sql.Date;

public class Gift {
	private int projectNo; //선물의 프로젝트 번호
	private int supportNo;
	private String myEmail; //선물받을사람 메일
	private String deliveryDueDate; //예상배송일
	private String address;//  배송받을 주소
	private String itemName; //선물명
	private String itemNum;  //선물 갯수
	private String projectTitle; //선물에 대한 프로젝트명
	private String projectWriter; //선물에 대한 프로젝트 게시자 메일
	private String deliveryYn; //배송여부 유무
	private String searchType;//검색타입
	private String postNum; 
	public Gift() {
		
	}
	
		


	
	
	public Gift(int projectNo, int supportNo, String myEmail, String deliveryDueDate, String address, String itemName,
			String itemNum, String projectTitle, String projectWriter, String deliveryYn, String searchType,
			String postNum) {
		
		this.projectNo = projectNo;
		this.supportNo = supportNo;
		this.myEmail = myEmail;
		this.deliveryDueDate = deliveryDueDate;
		this.address = address;
		this.itemName = itemName;
		this.itemNum = itemNum;
		this.projectTitle = projectTitle;
		this.projectWriter = projectWriter;
		this.deliveryYn = deliveryYn;
		this.searchType = searchType;
		this.postNum = postNum;
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

	public String getMyEmail() {
		return myEmail;
	}

	public void setMyEmail(String myEmail) {
		this.myEmail = myEmail;
	}

	public String getDeliveryDueDate() {
		return deliveryDueDate;
	}

	public void setDeliveryDueDate(String deliveryDueDate) {
		this.deliveryDueDate = deliveryDueDate;
	}

	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getPostNum() {
		return postNum;
	}

	public void setPostNum(String postNum) {
		this.postNum = postNum;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	
	public String getItemNum() {
		return itemNum;
	}
	public void setItemNumber(String itemNum) {
		this.itemNum = itemNum;
	}
	public String getProjectTitle() {
		return projectTitle;
	}

	public void setProjectTitle(String projectTitle) {
		this.projectTitle = projectTitle;
	}

	public String getProjectWriter() {
		return projectWriter;
	}

	public void setProjectWriter(String projectWriter) {
		this.projectWriter = projectWriter;
	}

	public String getDeliveryYn() {
		return deliveryYn;
	}

	public void setDeliveryYn(String deliveryYn) {
		this.deliveryYn = deliveryYn;
	}
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	@Override
	public String toString() {
		return "Gift [projectNo=" + projectNo + ", supportNo=" + supportNo + ", myEmail=" + myEmail
				+ ", deliveryDueDate=" + deliveryDueDate + ", address=" + address + ", itemName=" + itemName
				+ ", itemNum=" + itemNum + ", projectTitle=" + projectTitle + ", projectWriter=" + projectWriter
				+ ", deliveryYn=" + deliveryYn + ", searchType=" + searchType + ", postNum=" + postNum + "]";
	}
	
	
	
}
