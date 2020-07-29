package com.will.portal.professor.model;

import java.sql.Timestamp;

public class ProfessorVO {
	private String profNo;
	private String pwd;
	private String profName;
	private int depNo;
	private int positionNo;
	private Timestamp startDate;
	private Timestamp resignationDate;
	private String identityState;
	private String identifyCode;
	
	public String getProfNo() {
		return profNo;
	}
	public void setProfNo(String profNo) {
		this.profNo = profNo;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getProfName() {
		return profName;
	}
	public void setProfName(String profName) {
		this.profName = profName;
	}
	public int getDepNo() {
		return depNo;
	}
	public void setDepNo(int depNo) {
		this.depNo = depNo;
	}
	public int getPositionNo() {
		return positionNo;
	}
	public void setPositionNo(int positionNo) {
		this.positionNo = positionNo;
	}
	public Timestamp getStartDate() {
		return startDate;
	}
	public void setStartDate(Timestamp startDate) {
		this.startDate = startDate;
	}
	public Timestamp getResignationDate() {
		return resignationDate;
	}
	public void setResignationDate(Timestamp resignationDate) {
		this.resignationDate = resignationDate;
	}
	public String getIdentityState() {
		return identityState;
	}
	public void setIdentityState(String identityState) {
		this.identityState = identityState;
	}
	
	
	public String getIdentifyCode() {
		return identifyCode;
	}
	public void setIdentifyCode(String identifyCode) {
		this.identifyCode = identifyCode;
	}
	@Override
	public String toString() {
		return "ProfessorVO [profNo=" + profNo + ", pwd=" + pwd + ", profName=" + profName + ", depNo=" + depNo
				+ ", positionNo=" + positionNo + ", startDate=" + startDate + ", resignationDate=" + resignationDate
				+ ", identityState=" + identityState + ", identifyCode=" + identifyCode + "]";
	}
}
