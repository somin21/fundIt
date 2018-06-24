package com.kh.fundit.message.model.vo;

public class Message {

	private	int messageNo;
	private String messageContent;
	private String readyn;
	private String sendEmail;
	private String receiveEmail;
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
	@Override
	public String toString() {
		return "Message [messageNo=" + messageNo + ", messageContent=" + messageContent + ", readyn=" + readyn
				+ ", sendEmail=" + sendEmail + ", receiveEmail=" + receiveEmail + "]";
	}
	public Message(int messageNo, String messageContent, String readyn, String sendEmail, String receiveEmail) {
		super();
		this.messageNo = messageNo;
		this.messageContent = messageContent;
		this.readyn = readyn;
		this.sendEmail = sendEmail;
		this.receiveEmail = receiveEmail;
	}
	
	public Message() {}
	
	
}
