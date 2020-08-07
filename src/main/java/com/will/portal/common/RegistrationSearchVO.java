package com.will.portal.common;

public class RegistrationSearchVO extends SearchVO{
	private int facultyNo;
	private int depNo;
	private String subjName;
	private String time1;
	private String time2;
	private String profName;
	private String openSubCode;
	
	public int getFacultyNo() {
		return facultyNo;
	}
	public void setFacultyNo(int facultyNo) {
		this.facultyNo = facultyNo;
	}
	public int getDepNo() {
		return depNo;
	}
	public void setDepNo(int depNo) {
		this.depNo = depNo;
	}
	public String getSubjName() {
		return subjName;
	}
	public void setSubjName(String subjName) {
		this.subjName = subjName;
	}
	public String getTime1() {
		return time1;
	}
	public void setTime1(String time1) {
		this.time1 = time1;
	}
	public String getTime2() {
		return time2;
	}
	public void setTime2(String time2) {
		this.time2 = time2;
	}
	public String getProfName() {
		return profName;
	}
	public void setProfName(String profName) {
		this.profName = profName;
	}
	public String getOpenSubCode() {
		return openSubCode;
	}
	public void setOpenSubCode(String openSubCode) {
		this.openSubCode = openSubCode;
	}
	@Override
	public String toString() {
		return "RegistrationSearchVO [facultyNo=" + facultyNo + ", depNo=" + depNo + ", subjName=" + subjName
				+ ", time1=" + time1 + ", time2=" + time2 + ", profName=" + profName + ", openSubCode=" + openSubCode
				+ "]";
	}
	
	
	
	
	
}
