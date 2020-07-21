package com.will.portal.classroom.model;

public class ClassroomVO {
	private String classroomCode;
	private String classroomName;
	private String buildingCode;
	public String getClassroomCode() {
		return classroomCode;
	}
	public void setClassroomCode(String classroomCode) {
		this.classroomCode = classroomCode;
	}
	public String getClassroomName() {
		return classroomName;
	}
	public void setClassroomName(String classroomName) {
		this.classroomName = classroomName;
	}
	public String getBuildingCode() {
		return buildingCode;
	}
	public void setBuildingCode(String buildingCode) {
		this.buildingCode = buildingCode;
	}
	@Override
	public String toString() {
		return "ClassroomVO [classroomCode=" + classroomCode + ", classroomName=" + classroomName + ", buildingCode="
				+ buildingCode + "]";
	}
	
	
	
}
