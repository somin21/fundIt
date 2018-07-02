package com.kh.fundit.project.model.vo;

public class ProjectGift {
	private int projectNo;
	private int minMoney;
	private int itemnumber;
	private String itemName;
	private int itemno;
	private String giftexplain;
	private String deliveryYN;
	
	public ProjectGift() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProjectGift(int projectNo, int minMoney, int itemnumber, String itemName, int itemno, String giftexplain,
			String deliveryYN) {
		super();
		this.projectNo = projectNo;
		this.minMoney = minMoney;
		this.itemnumber = itemnumber;
		this.itemName = itemName;
		this.itemno = itemno;
		this.giftexplain = giftexplain;
		this.deliveryYN = deliveryYN;
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

	public int getItemnumber() {
		return itemnumber;
	}

	public void setItemnumber(int itemnumber) {
		this.itemnumber = itemnumber;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getItemno() {
		return itemno;
	}

	public void setItemno(int itemno) {
		this.itemno = itemno;
	}

	public String getGiftexplain() {
		return giftexplain;
	}

	public void setGiftexplain(String giftexplain) {
		this.giftexplain = giftexplain;
	}

	public String getDeliveryYN() {
		return deliveryYN;
	}

	public void setDeliveryYN(String deliveryYN) {
		this.deliveryYN = deliveryYN;
	}

	@Override
	public String toString() {
		return "[projectNo=" + projectNo + ", minMoney=" + minMoney + ", itemnumber=" + itemnumber
				+ ", itemName=" + itemName + ", itemno=" + itemno + ", giftexplain=" + giftexplain + ", deliveryYN="
				+ deliveryYN + ", giftrefund=" + "]";
	}
	
	
}
