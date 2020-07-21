package com.will.portal.open_subj.model;

import java.sql.Timestamp;

public class Open_subjVO {
	private String openSubCode;
	private String subjCode;
	private Timestamp openDate;
	private Timestamp closeDate;
	private String profNo;
	public String getOpenSubCode() {
		return openSubCode;
	}
	public void setOpenSubCode(String openSubCode) {
		this.openSubCode = openSubCode;
	}
	public String getSubjCode() {
		return subjCode;
	}
	public void setSubjCode(String subjCode) {
		this.subjCode = subjCode;
	}
	public Timestamp getOpenDate() {
		return openDate;
	}
	public void setOpenDate(Timestamp openDate) {
		this.openDate = openDate;
	}
	public Timestamp getCloseDate() {
		return closeDate;
	}
	public void setCloseDate(Timestamp closeDate) {
		this.closeDate = closeDate;
	}
	public String getProfNo() {
		return profNo;
	}
	public void setProfNo(String profNo) {
		this.profNo = profNo;
	}
	@Override
	public String toString() {
		return "Open_subjVO [openSubCode=" + openSubCode + ", subjCode=" + subjCode + ", openDate=" + openDate
				+ ", closeDate=" + closeDate + ", profNo=" + profNo + "]";
	}
	
	
	
	
	
}
