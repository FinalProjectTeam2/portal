package com.will.portal.reply.model;

import java.sql.Timestamp;

public class ReplyVO {
	private int replyNo;
	private String officialNo;
	private Timestamp regDate;
	private String contents;
	private int groupNo;
	private int sortNo;
	private int step;
	private String delFlag;
	private String postCode;
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public String getOfficialNo() {
		return officialNo;
	}
	public void setOfficialNo(String officialNo) {
		this.officialNo = officialNo;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	public int getSortNo() {
		return sortNo;
	}
	public void setSortNo(int sortNo) {
		this.sortNo = sortNo;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public String getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}
	public String getPostCode() {
		return postCode;
	}
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	@Override
	public String toString() {
		return "ReplyVO [replyNo=" + replyNo + ", officialNo=" + officialNo + ", regDate=" + regDate + ", contents="
				+ contents + ", groupNo=" + groupNo + ", sortNo=" + sortNo + ", step=" + step + ", delFlag=" + delFlag
				+ ", postCode=" + postCode + "]";
	}
	
	
}
