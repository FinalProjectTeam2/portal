package com.will.portal.authority.model;

import java.sql.Timestamp;

import com.will.portal.common.SearchVO;

public class AuthorityVO extends SearchVO{
	private String authCode;
	private String authName;
	private String authDesc;
	private String authLevel;
	private Timestamp regDate;
	public String getAuthCode() {
		return authCode;
	}
	public void setAuthCode(String authCode) {
		this.authCode = authCode;
	}
	public String getAuthName() {
		return authName;
	}
	public void setAuthName(String authName) {
		this.authName = authName;
	}
	public String getAuthDesc() {
		return authDesc;
	}
	public void setAuthDesc(String authDesc) {
		this.authDesc = authDesc;
	}
	public String getAuthLevel() {
		return authLevel;
	}
	public void setAuthLevel(String authLevel) {
		this.authLevel = authLevel;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "AuthorityVO [authCode=" + authCode + ", authName=" + authName + ", authDesc=" + authDesc
				+ ", authLevel=" + authLevel + ", regDate=" + regDate + "]";
	}
	
	
	
}
