package com.will.portal.regi_timetable.model;

public class Regi_timetableVO {
	private String openSubCode;
	private String shortNames;
	public String getOpenSubCode() {
		return openSubCode;
	}
	public void setOpenSubCode(String openSubCode) {
		this.openSubCode = openSubCode;
	}
	public String getShortNames() {
		return shortNames;
	}
	public void setShortNames(String shortNames) {
		this.shortNames = shortNames;
	}
	@Override
	public String toString() {
		return "Regi_timetableVO [openSubCode=" + openSubCode + ", shortNames=" + shortNames + "]";
	}
	
	
	
}
