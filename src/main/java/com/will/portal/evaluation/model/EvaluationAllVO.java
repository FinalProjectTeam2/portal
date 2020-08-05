package com.will.portal.evaluation.model;

import java.sql.Timestamp;

public class EvaluationAllVO {
	private String subCode;
	private String stuNo;
	private String classification;
	private int midterm;
	private int finals;
	private int assignment;
	private int attendance;
	private int etc;
	private int totalGrade;
	private Timestamp regDate;
	private Timestamp editDate;
	private String name;
	private String subjName;
	public String getSubCode() {
		return subCode;
	}
	public void setSubCode(String subCode) {
		this.subCode = subCode;
	}
	public String getStuNo() {
		return stuNo;
	}
	public void setStuNo(String stuNo) {
		this.stuNo = stuNo;
	}
	public String getClassification() {
		return classification;
	}
	public void setClassification(String classification) {
		this.classification = classification;
	}
	public int getMidterm() {
		return midterm;
	}
	public void setMidterm(int midterm) {
		this.midterm = midterm;
	}
	public int getFinals() {
		return finals;
	}
	public void setFinals(int finals) {
		this.finals = finals;
	}
	public int getAssignment() {
		return assignment;
	}
	public void setAssignment(int assignment) {
		this.assignment = assignment;
	}
	public int getAttendance() {
		return attendance;
	}
	public void setAttendance(int attendance) {
		this.attendance = attendance;
	}
	public int getEtc() {
		return etc;
	}
	public void setEtc(int etc) {
		this.etc = etc;
	}
	public int getTotalGrade() {
		return totalGrade;
	}
	public void setTotalGrade(int totalGrade) {
		this.totalGrade = totalGrade;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public Timestamp getEditDate() {
		return editDate;
	}
	public void setEditDate(Timestamp editDate) {
		this.editDate = editDate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubjName() {
		return subjName;
	}
	public void setSubjName(String subjName) {
		this.subjName = subjName;
	}
	
	@Override
	public String toString() {
		return "EvaluationAllVO [subCode=" + subCode + ", stuNo=" + stuNo + ", classification=" + classification
				+ ", midterm=" + midterm + ", finals=" + finals + ", assignment=" + assignment + ", attendance="
				+ attendance + ", etc=" + etc + ", totalGrade=" + totalGrade + ", regDate=" + regDate + ", editDate="
				+ editDate + ", name=" + name + ", subjName=" + subjName + "]";
	}
	
	
	
	
	
}
