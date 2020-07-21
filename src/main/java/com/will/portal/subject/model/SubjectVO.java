package com.will.portal.subject.model;

public class SubjectVO {
	private String subjCode;
	private String subjName;
	private String explanation;
	private String typeCode;
	private int credit;
	private String profNo;
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
	public String getTypeCode() {
		return typeCode;
	}
	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}
	public int getCredit() {
		return credit;
	}
	public void setCredit(int credit) {
		this.credit = credit;
	}
	public String getProfNo() {
		return profNo;
	}
	public void setProfNo(String profNo) {
		this.profNo = profNo;
	}
	@Override
	public String toString() {
		return "SubjectVO [subjCode=" + subjCode + ", subjName=" + subjName + ", explanation=" + explanation
				+ ", typeCode=" + typeCode + ", credit=" + credit + ", profNo=" + profNo + "]";
	}
	
	
	
}
