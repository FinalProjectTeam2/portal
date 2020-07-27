package com.will.portal.prof_position.model;

public class Prof_positionVO {
	private int positionNo;
	private String positionName;
	
	public Prof_positionVO() {
		super();
	}
	public int getPositionNo() {
		return positionNo;
	}
	public void setPositionNo(int positionNo) {
		this.positionNo = positionNo;
	}
	public String getPositionName() {
		return positionName;
	}
	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}
	@Override
	public String toString() {
		return "Prof_positionVO [positionNo=" + positionNo + ", positionName=" + positionName + "]";
	}
}
