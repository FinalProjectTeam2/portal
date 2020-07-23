package com.will.portal.student.model;

import java.sql.Timestamp;

public class StudentVO {
	private String stuNo;
	private String pwd;
	private String name;
	private int major;
	private int semester;
	private int credits;
	private String state;
	private Timestamp admissionDate;
	private Timestamp graduationDate;
	private String identityState;
	private int minor;
	private String identifyCode;
	
	public String getStuNo() {
		return stuNo;
	}
	public void setStuNo(String stuNo) {
		this.stuNo = stuNo;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getMajor() {
		return major;
	}
	public void setMajor(int major) {
		this.major = major;
	}
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
	}
	public int getCredits() {
		return credits;
	}
	public void setCredits(int credits) {
		this.credits = credits;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Timestamp getAdmissionDate() {
		return admissionDate;
	}
	public void setAdmissionDate(Timestamp admissionDate) {
		this.admissionDate = admissionDate;
	}
	public Timestamp getGraduationDate() {
		return graduationDate;
	}
	public void setGraduationDate(Timestamp graduationDate) {
		this.graduationDate = graduationDate;
	}
	public String getIdentityState() {
		return identityState;
	}
	public void setIdentityState(String identityState) {
		this.identityState = identityState;
	}
	public int getMinor() {
		return minor;
	}
	public void setMinor(int minor) {
		this.minor = minor;
	}
	public String getIdentifyCode() {
		return identifyCode;
	}
	public void setIdentifyCode(String identifyCode) {
		this.identifyCode = identifyCode;
	}
	@Override
	public String toString() {
		return "StudentVO [stuNo=" + stuNo + ", pwd=" + pwd + ", name=" + name + ", major=" + major + ", semester="
				+ semester + ", credits=" + credits + ", state=" + state + ", admissionDate=" + admissionDate
				+ ", graduationDate=" + graduationDate + ", identityState=" + identityState + ", minor=" + minor
				+ ", identifyCode=" + identifyCode + "]";
	}
	
	
	
	
	
	
}
