package com.will.portal.subj_time.model;

public class Subj_timetableVO {
	private int lectureTimeNo;
	private String openSubCode;
	private String timetableCode;
	private String classroomCode;
	private String subjName;
	public int getLectureTimeNo() {
		return lectureTimeNo;
	}
	public void setLectureTimeNo(int lectureTimeNo) {
		this.lectureTimeNo = lectureTimeNo;
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
	public String getSubjName() {
		return subjName;
	}
	public void setSubjName(String subjName) {
		this.subjName = subjName;
	}
	@Override
	public String toString() {
		return "Subj_timetableVO [lectureTimeNo=" + lectureTimeNo + ", openSubCode=" + openSubCode + ", timetableCode="
				+ timetableCode + ", classroomCode=" + classroomCode + ", subjName=" + subjName + "]";
	}
	
	
	
}
