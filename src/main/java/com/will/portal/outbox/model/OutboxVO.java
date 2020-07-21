package com.will.portal.outbox.model;

import java.sql.Timestamp;

public class OutboxVO {
	private int msgNo;
	private String sender;
	private String title;
	private String contents;
	private Timestamp sendDate;
	public int getMsgNo() {
		return msgNo;
	}
	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Timestamp getSendDate() {
		return sendDate;
	}
	public void setSendDate(Timestamp sendDate) {
		this.sendDate = sendDate;
	}
	@Override
	public String toString() {
		return "OutboxVO [msgNo=" + msgNo + ", sender=" + sender + ", title=" + title + ", contents=" + contents
				+ ", sendDate=" + sendDate + "]";
	}
	
	
	
}
