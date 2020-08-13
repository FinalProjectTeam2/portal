package com.will.portal.student.model;

public class StudentTimeTableVO {
	private String subjCode;
	private String subjName;
	private String explanation;
	private String profName;
	private String classroomName;
	private String timetableCode;
	private String lectureEvalFlag;
	private int credit;
	
	public String getSubjCode() {
		return subjCode;
	}
	public void setSubjCode(String subjCode) {
		this.subjCode = subjCode;
	}
	public String getSubjName() {
		return subjName;
	}
	public void setSubjName(String subjName) {
		this.subjName = subjName;
	}
	public String getExplanation() {
		return explanation;
	}
	public void setExplanation(String explanation) {
		this.explanation = explanation;
	}
	public String getProfName() {
		return profName;
	}
	public void setProfName(String profName) {
		this.profName = profName;
	}
	public String getClassroomName() {
		return classroomName;
	}
	public void setClassroomName(String classroomName) {
		this.classroomName = classroomName;
	}
	public String getTimetableCode() {
		return timetableCode;
	}
	public void setTimetableCode(String timetableCode) {
		this.timetableCode = timetableCode;
	}
	public String getLectureEvalFlag() {
		return lectureEvalFlag;
	}
	public void setLectureEvalFlag(String lectureEvalFlag) {
		this.lectureEvalFlag = lectureEvalFlag;
	}
	public int getCredit() {
		return credit;
	}
	public void setCredit(int credit) {
		this.credit = credit;
	}
	@Override
	public String toString() {
		return "StudentTimeTableVO [subjCode=" + subjCode + ", subjName=" + subjName + ", explanation=" + explanation
				+ ", profName=" + profName + ", classroomName=" + classroomName + ", timetableCode=" + timetableCode
				+ ", lectureEvalFlag=" + lectureEvalFlag + ", credit=" + credit + "]";
	}
	
	
	
}
