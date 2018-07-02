package com.kh.fundit.help.model.vo;

import java.sql.Date;

public class Help {
	
	private int messageNo;
	private String messageContent;
	private String readYn;
	private String sendMail;
	private String receiveEmail;
	private Date messageDate;
 
	public Help() {}

	public Help(int messageNo, String messageContent, String readYn, String sendMail, String receiveEmail,
			Date messageDate) {
		super();
		this.messageNo = messageNo;
		this.messageContent = messageContent;
		this.readYn = readYn;
		this.sendMail = sendMail;
		this.receiveEmail = receiveEmail;
		this.messageDate = messageDate;
	}

	public int getMessageNo() {
		return messageNo;
	}

	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}

	public String getMessageContent() {
		return messageContent;
	}

	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}

	public String getReadYn() {
		return readYn;
	}

	public void setReadYn(String readYn) {
		this.readYn = readYn;
	}

	public String getSendMail() {
		return sendMail;
	}

	public void setSendMail(String sendMail) {
		this.sendMail = sendMail;
	}

	public String getReceiveEmail() {
		return receiveEmail;
	}

	public void setReceiveEmail(String receiveEmail) {
		this.receiveEmail = receiveEmail;
	}

	public Date getMessageDate() {
		return messageDate;
	}

	public void setMessageDate(Date messageDate) {
		this.messageDate = messageDate;
	}

	@Override
	public String toString() {
		return "Help [messageNo=" + messageNo + ", messageContent=" + messageContent + ", readYn=" + readYn
				+ ", sendMail=" + sendMail + ", receiveEmail=" + receiveEmail + ", messageDate=" + messageDate + "]";
	}
	
}
