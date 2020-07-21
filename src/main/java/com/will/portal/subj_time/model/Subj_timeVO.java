package com.will.portal.subj_time.model;

public class Subj_timeVO {
	private String lectureTimeCode;
	private String openSubCode;
	private String timetableCode;
	private String classroomCode;
	public String getLectureTimeCode() {
		return lectureTimeCode;
	}
	public void setLectureTimeCode(String lectureTimeCode) {
		this.lectureTimeCode = lectureTimeCode;
	}
	public String getOpenSubCode() {
		return openSubCode;
	}
	public void setOpenSubCode(String openSubCode) {
		this.openSubCode = openSubCode;
	}
	public String getTimetableCode() {
		return timetableCode;
	}
	public void setTimetableCode(String timetableCode) {
		this.timetableCode = timetableCode;
	}
	public String getClassroomCode() {
		return classroomCode;
	}
	public void setClassroomCode(String classroomCode) {
		this.classroomCode = classroomCode;
	}
	@Override
	public String toString() {
		return "Subj_timeVO [lectureTimeCode=" + lectureTimeCode + ", openSubCode=" + openSubCode + ", timetableCode="
				+ timetableCode + ", classroomCode=" + classroomCode + "]";
	}
	
	
	
	
}
