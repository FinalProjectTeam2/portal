package com.will.portal.common;

public class MessageVO {
	private String message;
	private String identState;
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
	@Override
	public String toString() {
		return "MessageVO [message=" + message + ", identState=" + identState + "]";
	}
	
	
}
