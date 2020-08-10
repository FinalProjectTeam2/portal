package com.will.portal.phoneBook.model;

public class PhoneBookVO {
	private String stuNo;
	private String name;
	private int semester;
	private String depName;
	private String phoneNo;
	
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
	public String getDepName() {
		return depName;
	}
	public void setDepName(String depName) {
		this.depName = depName;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "PhoneBookVO [stuNo=" + stuNo + ", name=" + name + ", semester=" + semester + ", depName=" + depName
				+ ", phoneNo=" + phoneNo + "]";
	}
	
}
