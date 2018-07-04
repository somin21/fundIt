package com.kh.fundit.admin.model.vo;

import java.sql.Date;

public class AdminMessage {
	
	private int messageNo;
	private String sendEmail;
	private String receiveEmail;
	private String messageContent;
	private String readyn;
	private String messageDate;
	
	
	public AdminMessage() {}


	public AdminMessage(int messageNo, String sendEmail, String receiveEmail, String messageContent, String readyn,
			String messageDate) {
		this.messageNo = messageNo;
		this.sendEmail = sendEmail;
		this.receiveEmail = receiveEmail;
		this.messageContent = messageContent;
		this.readyn = readyn;
		this.messageDate = messageDate;
	}


	public int getMessageNo() {
		return messageNo;
	}


	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}


	public String getSendEmail() {
		return sendEmail;
	}


	public void setSendEmail(String sendEmail) {
		this.sendEmail = sendEmail;
	}


	public String getReceiveEmail() {
		return receiveEmail;
	}


	public void setReceiveEmail(String receiveEmail) {
		this.receiveEmail = receiveEmail;
	}


	public String getMessageContent() {
		return messageContent;
	}


	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}


	public String getReadyn() {
		return readyn;
	}


	public void setReadyn(String readyn) {
		this.readyn = readyn;
	}


	public String getMessageDate() {
		return messageDate;
	}


	public void setMessageDate(String messageDate) {
		this.messageDate = messageDate;
	}


	@Override
	public String toString() {
		return "AdminMessage [messageNo=" + messageNo + ", sendEmail=" + sendEmail + ", receiveEmail=" + receiveEmail
				+ ", messageContent=" + messageContent + ", readyn=" + readyn + ", messageDate=" + messageDate + "]";
	}
	
	
	
	
}
