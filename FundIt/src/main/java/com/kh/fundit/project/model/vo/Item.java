package com.kh.fundit.project.model.vo;

public class Item {
	
	private int itemNo;
	private String itemName;
	private int projectNo;
	
	public Item() {}
	
	public Item(int itemNo, String itemName, int projectNo) {
		this.itemNo = itemNo;
		this.itemName = itemName;
		this.projectNo = projectNo;
	}

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	@Override
	public String toString() {
		return "Item [itemNo=" + itemNo + ", itemName=" + itemName + ", projectNo=" + projectNo + "]";
	}
	
	
	
	

}
