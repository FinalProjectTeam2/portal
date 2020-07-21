package com.will.portal.syllabus.model;

public class SyllabusVO {
	private String openSubCode;
	private String syllabus;
	private int theoryTime;
	private int trainingTime;
	public String getOpenSubCode() {
		return openSubCode;
	}
	public void setOpenSubCode(String openSubCode) {
		this.openSubCode = openSubCode;
	}
	public String getSyllabus() {
		return syllabus;
	}
	public void setSyllabus(String syllabus) {
		this.syllabus = syllabus;
	}
	public int getTheoryTime() {
		return theoryTime;
	}
	public void setTheoryTime(int theoryTime) {
		this.theoryTime = theoryTime;
	}
	public int getTrainingTime() {
		return trainingTime;
	}
	public void setTrainingTime(int trainingTime) {
		this.trainingTime = trainingTime;
	}
	@Override
	public String toString() {
		return "SyllabusVO [openSubCode=" + openSubCode + ", syllabus=" + syllabus + ", theoryTime=" + theoryTime
				+ ", trainingTime=" + trainingTime + "]";
	}
	
	
	
	
	
}
