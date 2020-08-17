package com.will.portal.common;

public class AdminSubjSearchVO extends SearchVO {
	private String typeCode;
	private int facultyNo;
	private int depNo;
	private String profName;
	private String subjName;
	private String openSubCode;
	public String getTypeCode() {
		return typeCode;
	}
	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}
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
	public String getProfName() {
		return profName;
	}
	public void setProfName(String profName) {
		this.profName = profName;
	}
	public String getSubjName() {
		return subjName;
	}
	public void setSubjName(String subjName) {
		this.subjName = subjName;
	}
	public String getOpenSubCode() {
		return openSubCode;
	}
	public void setOpenSubCode(String openSubCode) {
		this.openSubCode = openSubCode;
	}
	@Override
	public String toString() {
		return "AdminSubjSearchVO [typeCode=" + typeCode + ", facultyNo=" + facultyNo + ", depNo=" + depNo
				+ ", profName=" + profName + ", subjName=" + subjName + ", openSubCode=" + openSubCode + "]";
	}
	
	
}
