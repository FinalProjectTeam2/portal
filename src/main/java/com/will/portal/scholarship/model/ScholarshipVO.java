package com.will.portal.scholarship.model;

public class ScholarshipVO {
	private int scholarshipNo;
	private String scholarshipType;
	private int scholarship;
	public int getScholarshipNo() {
		return scholarshipNo;
	}
	public void setScholarshipNo(int scholarshipNo) {
		this.scholarshipNo = scholarshipNo;
	}
	public String getScholarshipType() {
		return scholarshipType;
	}
	public void setScholarshipType(String scholarshipType) {
		this.scholarshipType = scholarshipType;
	}
	public int getScholarship() {
		return scholarship;
	}
	public void setScholarship(int scholarship) {
		this.scholarship = scholarship;
	}
	@Override
	public String toString() {
		return "ScholarshipVO [scholarshipNo=" + scholarshipNo + ", scholarshipType=" + scholarshipType
				+ ", scholarship=" + scholarship + "]";
	}

	
}
