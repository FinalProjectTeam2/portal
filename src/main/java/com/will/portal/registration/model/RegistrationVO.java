package com.will.portal.registration.model;

import java.sql.Timestamp;

public class RegistrationVO {
	private String subCode;
	private String stuNo;
	private String classification;
	private Timestamp regDate;
	private int score;
	private String lectureEvalFlag;
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
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getLectureEvalFlag() {
		return lectureEvalFlag;
	}
	public void setLectureEvalFlag(String lectureEvalFlag) {
		this.lectureEvalFlag = lectureEvalFlag;
	}
	@Override
	public String toString() {
		return "RegistrationVO [subCode=" + subCode + ", stuNo=" + stuNo + ", classification=" + classification
				+ ", regDate=" + regDate + ", score=" + score + ", lectureEvalFlag=" + lectureEvalFlag + "]";
	}
	
	
}
