package com.will.portal.common;

public class MessageVO {
	private String message;
	private String identState;
	private String identSsn;
	private String officialNo;
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getIdentState() {
		return identState;
	}
	public void setIdentState(String identState) {
		this.identState = identState;
	}
	
	
	
	public String getIdentSsn() {
		return identSsn;
	}
	public void setIdentSsn(String identSsn) {
		this.identSsn = identSsn;
	}
	
	
	
	
	
	
	public String getOfficialNo() {
		return officialNo;
	}
	public void setOfficialNo(String officialNo) {
		this.officialNo = officialNo;
	}
	@Override
	public String toString() {
		return "MessageVO [message=" + message + ", identState=" + identState + ", identSsn=" + identSsn
				+ ", officialNo=" + officialNo + "]";
	}
	
	
	
	
}
