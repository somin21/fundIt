package com.kh.fundit.message.model.vo;



public class Message {

	private	int messageNo;
	private String messageContent;
	private String readyn;
	private String sendEmail;
	private String receiveEmail;
	private String messageDate;
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
	public String getReadyn() {
		return readyn;
	}
	public void setReadyn(String readyn) {
		this.readyn = readyn;
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
	public String getMessageDate() {
		return messageDate;
	}
	public void setMessageDate(String messageDate) {
		this.messageDate = messageDate;
	}
	@Override
	public String toString() {
		return "Message [messageNo=" + messageNo + ", messageContent=" + messageContent + ", readyn=" + readyn
				+ ", sendEmail=" + sendEmail + ", receiveEmail=" + receiveEmail + ", messageDate=" + messageDate + "]";
	}
	public Message(int messageNo, String messageContent, String readyn, String sendEmail, String receiveEmail,
			String messageDate) {
		super();
		this.messageNo = messageNo;
		this.messageContent = messageContent;
		this.readyn = readyn;
		this.sendEmail = sendEmail;
		this.receiveEmail = receiveEmail;
		this.messageDate = messageDate;
	}
	
	public Message() {}
	
	
}
