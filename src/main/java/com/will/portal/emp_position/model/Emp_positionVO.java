package com.will.portal.emp_position.model;

public class Emp_positionVO {
	private String positionCode;
	private String positionName;
	public String getPositionCode() {
		return positionCode;
	}
	public void setPositionCode(String positionCode) {
		this.positionCode = positionCode;
	}
	public String getPositionName() {
		return positionName;
	}
	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}
	@Override
	public String toString() {
		return "Emp_positionVO [positionCode=" + positionCode + ", positionName=" + positionName + "]";
	}
	
	

}
