package com.will.portal.inbox.model;

import java.sql.Timestamp;

public class InboxVO {
	private int no;
	private String msgNo;
	private String address;
	private Timestamp readDate;
	private String keepFlag;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getMsgNo() {
		return msgNo;
	}
	public void setMsgNo(String msgNo) {
		this.msgNo = msgNo;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Timestamp getReadDate() {
		return readDate;
	}
	public void setReadDate(Timestamp readDate) {
		this.readDate = readDate;
	}
	public String getKeepFlag() {
		return keepFlag;
	}
	public void setKeepFlag(String keepFlag) {
		this.keepFlag = keepFlag;
	}
	@Override
	public String toString() {
		return "InboxVO [no=" + no + ", msgNo=" + msgNo + ", address=" + address + ", readDate=" + readDate
				+ ", keepFlag=" + keepFlag + "]";
	}

	
}
