package com.will.portal.faculty.model;

public class FacultyVO {
	private int facultyNo;
	private String facultyName;
	
	public int getFacultyNo() {
		return facultyNo;
	}
	public void setFacultyNo(int facultyNo) {
		this.facultyNo = facultyNo;
	}
	public String getFacultyName() {
		return facultyName;
	}
	public void setFacultyName(String facultyName) {
		this.facultyName = facultyName;
	}
	@Override
	public String toString() {
		return "FacultyVO [facultyNo=" + facultyNo + ", facultyName=" + facultyName + "]";
	}
	
	
}
