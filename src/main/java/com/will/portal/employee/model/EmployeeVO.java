package com.will.portal.employee.model;

import java.sql.Timestamp;

public class EmployeeVO {
	private String empNo;
	private String pwd;
	private Timestamp startDate;
	private String depCode;
	private String authCode;
	private String empName;
	private Timestamp resignationDate;
	private String identityState;
	
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public Timestamp getStartDate() {
		return startDate;
	}
	public void setStartDate(Timestamp startDate) {
		this.startDate = startDate;
	}
	public String getDepCode() {
		return depCode;
	}
	public void setDepCode(String depCode) {
		this.depCode = depCode;
	}
	public String getAuthCode() {
		return authCode;
	}
	public void setAuthCode(String authCode) {
		this.authCode = authCode;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
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
	@Override
	public String toString() {
		return "EmployeeVO [empNo=" + empNo + ", pwd=" + pwd + ", startDate=" + startDate + ", depCode=" + depCode
				+ ", authCode=" + authCode + ", empName=" + empName + ", resignationDate=" + resignationDate
				+ ", identityState=" + identityState + "]";
	}
	
	
	
}
