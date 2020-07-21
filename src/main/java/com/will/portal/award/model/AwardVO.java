package com.will.portal.award.model;

import java.sql.Timestamp;

public class AwardVO {
	private int no;
	private String stuNo;
	private int scholarshipNo;
	private Timestamp awardingDate;
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
	public int getScholarshipNo() {
		return scholarshipNo;
	}
	public void setScholarshipNo(int scholarshipNo) {
		this.scholarshipNo = scholarshipNo;
	}
	public Timestamp getAwardingDate() {
		return awardingDate;
	}
	public void setAwardingDate(Timestamp awardingDate) {
		this.awardingDate = awardingDate;
	}
	@Override
	public String toString() {
		return "AwardVO [no=" + no + ", stuNo=" + stuNo + ", scholarshipNo=" + scholarshipNo + ", awardingDate="
				+ awardingDate + "]";
	}
	
	
}
