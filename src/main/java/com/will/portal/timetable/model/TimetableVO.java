package com.will.portal.timetable.model;

public class TimetableVO {
	private String timetableCode;
	private String timetableName;
	private String day;
	private int period;
	public String getTimetableCode() {
		return timetableCode;
	}
	public void setTimetableCode(String timetableCode) {
		this.timetableCode = timetableCode;
	}
	public String getTimetableName() {
		return timetableName;
	}
	public void setTimetableName(String timetableName) {
		this.timetableName = timetableName;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public int getPeriod() {
		return period;
	}
	public void setPeriod(int period) {
		this.period = period;
	}
	@Override
	public String toString() {
		return "TimetableVO [timetableCode=" + timetableCode + ", timetableName=" + timetableName + ", day=" + day
				+ ", period=" + period + "]";
	}
	
	
	
}
