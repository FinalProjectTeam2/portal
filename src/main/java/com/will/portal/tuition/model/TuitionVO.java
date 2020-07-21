package com.will.portal.tuition.model;

import java.sql.Timestamp;

public class TuitionVO {
	private int no;
	private String stuNo;
	private int semester;
	private int tuition;
	private String depositState;
	private Timestamp depositDate;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getStuNo() {
		return stuNo;
	}
	public void setStuNo(String stuNo) {
		this.stuNo = stuNo;
	}
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
	}
	public int getTuition() {
		return tuition;
	}
	public void setTuition(int tuition) {
		this.tuition = tuition;
	}
	public String getDepositState() {
		return depositState;
	}
	public void setDepositState(String depositState) {
		this.depositState = depositState;
	}
	public Timestamp getDepositDate() {
		return depositDate;
	}
	public void setDepositDate(Timestamp depositDate) {
		this.depositDate = depositDate;
	}
	@Override
	public String toString() {
		return "TuitionVO [no=" + no + ", stuNo=" + stuNo + ", semester=" + semester + ", tuition=" + tuition
				+ ", depositState=" + depositState + ", depositDate=" + depositDate + "]";
	}
	
	
}
