package com.will.portal.department.model;

public class DepartmentVO {
	private int depNo;
	private String depName;
	private String tel;
	private String buildingCode;
	private int facultyNo;
	private int totalCredit;
	public int getDepNo() {
		return depNo;
	}
	public void setDepNo(int depNo) {
		this.depNo = depNo;
	}
	public String getDepName() {
		return depName;
	}
	public void setDepName(String depName) {
		this.depName = depName;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getBuildingCode() {
		return buildingCode;
	}
	public void setBuildingCode(String buildingCode) {
		this.buildingCode = buildingCode;
	}
	public int getFacultyNo() {
		return facultyNo;
	}
	public void setFacultyNo(int facultyNo) {
		this.facultyNo = facultyNo;
	}
	public int getTotalCredit() {
		return totalCredit;
	}
	public void setTotalCredit(int totalCredit) {
		this.totalCredit = totalCredit;
	}
	@Override
	public String toString() {
		return "DepartmentVO [depNo=" + depNo + ", depName=" + depName + ", tel=" + tel + ", buildingCode="
				+ buildingCode + ", facultyNo=" + facultyNo + ", totalCredit=" + totalCredit + "]";
	}
	
	
	
}
