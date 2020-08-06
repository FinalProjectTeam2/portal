package com.will.portal.registration.model;

public class OpenSubjListVO {
	private String openSubCode;
	private String subjName;
	private int personnel;
	private String profName;
	private int credit;
	private String timetableName;
	private String classroomName;
	private String type;
	private String syllabus;
	private String shortNames;
	
	public String getOpenSubCode() {
		return openSubCode;
	}
	public void setOpenSubCode(String openSubCode) {
		this.openSubCode = openSubCode;
	}
	public String getSubjName() {
		return subjName;
	}
	public void setSubjName(String subjName) {
		this.subjName = subjName;
	}
	public int getPersonnel() {
		return personnel;
	}
	public void setPersonnel(int personnel) {
		this.personnel = personnel;
	}
	public String getProfName() {
		return profName;
	}
	public void setProfName(String profName) {
		this.profName = profName;
	}
	public int getCredit() {
		return credit;
	}
	public void setCredit(int credit) {
		this.credit = credit;
	}
	public String getTimetableName() {
		return timetableName;
	}
	public void setTimetableName(String timetableName) {
		this.timetableName = timetableName;
	}
	public String getClassroomName() {
		return classroomName;
	}
	public void setClassroomName(String classroomName) {
		this.classroomName = classroomName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSyllabus() {
		return syllabus;
	}
	public void setSyllabus(String syllabus) {
		this.syllabus = syllabus;
	}
	public String getShortNames() {
		return shortNames;
	}
	public void setShortNames(String shortNames) {
		this.shortNames = shortNames;
	}
	@Override
	public String toString() {
		return "OpenSubjListVO [openSubCode=" + openSubCode + ", subjName=" + subjName + ", personnel=" + personnel
				+ ", profName=" + profName + ", credit=" + credit + ", timetableName=" + timetableName
				+ ", classroomName=" + classroomName + ", type=" + type + ", syllabus=" + syllabus + ", shortNames="
				+ shortNames + "]";
	}
	
	
	
	
	
}
