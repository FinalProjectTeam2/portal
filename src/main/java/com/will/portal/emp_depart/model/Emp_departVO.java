package com.will.portal.emp_depart.model;

public class Emp_departVO {
	private String depCode;
	private String depName;
	private String positionCode;
	public String getDepCode() {
		return depCode;
	}
	public void setDepCode(String depCode) {
		this.depCode = depCode;
	}
	public String getDepName() {
		return depName;
	}
	public void setDepName(String depName) {
		this.depName = depName;
	}
	public String getPositionCode() {
		return positionCode;
	}
	public void setPositionCode(String positionCode) {
		this.positionCode = positionCode;
	}
	@Override
	public String toString() {
		return "Emp_departVO [depCode=" + depCode + ", depName=" + depName + ", positionCode=" + positionCode + "]";
	}
	
	
}
