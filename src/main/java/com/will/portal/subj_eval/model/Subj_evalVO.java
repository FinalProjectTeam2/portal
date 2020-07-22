package com.will.portal.subj_eval.model;

public class Subj_evalVO {
	private String subCode;
	private String stuNo;
	private String classification;
	private int q1;
	private int q2;
	private int q3;
	private int q4;
	private int q5;
	private int q6;
	private int q7;
	private int q8;
	private String content;
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
	public int getQ1() {
		return q1;
	}
	public void setQ1(int q1) {
		this.q1 = q1;
	}
	public int getQ2() {
		return q2;
	}
	public void setQ2(int q2) {
		this.q2 = q2;
	}
	public int getQ3() {
		return q3;
	}
	public void setQ3(int q3) {
		this.q3 = q3;
	}
	public int getQ4() {
		return q4;
	}
	public void setQ4(int q4) {
		this.q4 = q4;
	}
	public int getQ5() {
		return q5;
	}
	public void setQ5(int q5) {
		this.q5 = q5;
	}
	public int getQ6() {
		return q6;
	}
	public void setQ6(int q6) {
		this.q6 = q6;
	}
	public int getQ7() {
		return q7;
	}
	public void setQ7(int q7) {
		this.q7 = q7;
	}
	public int getQ8() {
		return q8;
	}
	public void setQ8(int q8) {
		this.q8 = q8;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "Subj_evalVO [subCode=" + subCode + ", stuNo=" + stuNo + ", classification=" + classification + ", q1="
				+ q1 + ", q2=" + q2 + ", q3=" + q3 + ", q4=" + q4 + ", q5=" + q5 + ", q6=" + q6 + ", q7=" + q7 + ", q8="
				+ q8 + ", content=" + content + "]";
	}
	
	
}
