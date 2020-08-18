package com.will.portal.admin.model;

public class AdminOpenSebjVO {
	private String openSubCode;
	private String subjName;
	private String profName;
	private String depName;
	private String facultyName;
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
	public String getProfName() {
		return profName;
	}
	public void setProfName(String profName) {
		this.profName = profName;
	}
	public String getDepName() {
		return depName;
	}
	public void setDepName(String depName) {
		this.depName = depName;
	}
	public String getFacultyName() {
		return facultyName;
	}
	public void setFacultyName(String facultyName) {
		this.facultyName = facultyName;
	}
	@Override
	public String toString() {
		return "AdminOpenSebjVO [openSubCode=" + openSubCode + ", subjName=" + subjName + ", profName=" + profName
				+ ", depName=" + depName + ", facultyName=" + facultyName + "]";
	}
	
	
}
