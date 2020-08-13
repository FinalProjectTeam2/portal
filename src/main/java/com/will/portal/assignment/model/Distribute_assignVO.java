package com.will.portal.assignment.model;

import java.sql.Timestamp;

public class Distribute_assignVO {
	private int assignNo;
	private String openSubCode;
	private String assignName;
	private Timestamp regDate;
	public int getAssignNo() {
		return assignNo;
	}
	public void setAssignNo(int assignNo) {
		this.assignNo = assignNo;
	}
	public String getOpenSubCode() {
		return openSubCode;
	}
	public void setOpenSubCode(String openSubCode) {
		this.openSubCode = openSubCode;
	}
	public String getAssignName() {
		return assignName;
	}
	public void setAssignName(String assignName) {
		this.assignName = assignName;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "Distribute_assignVO [assignNo=" + assignNo + ", openSubCode=" + openSubCode + ", assignName="
				+ assignName + ", regDate=" + regDate + "]";
	}
	
	
	
}
