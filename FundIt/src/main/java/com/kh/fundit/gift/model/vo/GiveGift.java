package com.kh.fundit.gift.model.vo;

public class GiveGift {
	private int projectno;
	private String projectWriter;
	private String projectTitle;
	private String projectConfirmYn;
	private int supportNo;
	private String supportor;
	private int supportMoney;
	private String payYn;
	private String address;
	private String postNum;
	private String itemName;
	private String itemNum;
	private String deliveryYn;
	private String deliveryDueDate;
	
	public GiveGift() {
		
	}

	public GiveGift(int projectno, String projectWriter, String projectTitle, String projectConfirmYn, int supportNo,
			String supportor, int supportMoney, String payYn, String address, String postNum, String itemName,
			String itemNum, String deliveryYn, String deliveryDueDate) {
		
		this.projectno = projectno;
		this.projectWriter = projectWriter;
		this.projectTitle = projectTitle;
		this.projectConfirmYn = projectConfirmYn;
		this.supportNo = supportNo;
		this.supportor = supportor;
		this.supportMoney = supportMoney;
		this.payYn = payYn;
		this.address = address;
		this.postNum = postNum;
		this.itemName = itemName;
		this.itemNum = itemNum;
		this.deliveryYn = deliveryYn;
		this.deliveryDueDate = deliveryDueDate;
	}

	public int getProjectno() {
		return projectno;
	}

	public void setProjectno(int projectno) {
		this.projectno = projectno;
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

	public String getProjectConfirmYn() {
		return projectConfirmYn;
	}

	public void setProjectConfirmYn(String projectConfirmYn) {
		this.projectConfirmYn = projectConfirmYn;
	}

	public int getSupportNo() {
		return supportNo;
	}

	public void setSupportNo(int supportNo) {
		this.supportNo = supportNo;
	}

	public String getSupportor() {
		return supportor;
	}

	public void setSupportor(String supportor) {
		this.supportor = supportor;
	}

	public int getSupportMoney() {
		return supportMoney;
	}

	public void setSupportMoney(int supportMoney) {
		this.supportMoney = supportMoney;
	}

	public String getPayYn() {
		return payYn;
	}

	public void setPayYn(String payYn) {
		this.payYn = payYn;
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

	public void setItemNum(String itemNum) {
		this.itemNum = itemNum;
	}

	public String getDeliveryYn() {
		return deliveryYn;
	}

	public void setDeliveryYn(String deliveryYn) {
		this.deliveryYn = deliveryYn;
	}

	public String getDeliveryDueDate() {
		return deliveryDueDate;
	}

	public void setDeliveryDueDate(String deliveryDueDate) {
		this.deliveryDueDate = deliveryDueDate;
	}

	@Override
	public String toString() {
		return "GiveGift [projectno=" + projectno + ", projectWriter=" + projectWriter + ", projectTitle="
				+ projectTitle + ", projectConfirmYn=" + projectConfirmYn + ", supportNo=" + supportNo + ", supportor="
				+ supportor + ", supportMoney=" + supportMoney + ", payYn=" + payYn + ", address=" + address
				+ ", postNum=" + postNum + ", itemName=" + itemName + ", itemNum=" + itemNum + ", deliveryYn="
				+ deliveryYn + ", deliveryDueDate=" + deliveryDueDate + "]";
	}
	
	
	
	
	
	

}
