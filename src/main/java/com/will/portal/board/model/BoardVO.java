package com.will.portal.board.model;

import java.sql.Timestamp;

public class BoardVO {
	private int bdNo;
	private String officialNo;
	private String bdName;
	private Timestamp regDate;
	private Timestamp editDate;
	private int bdOrder;
	private String usage;
	private String isReply;
	private String isComment;
	private String isPrivate;
	private String isUpload;
	private int maxUpfile;
	private long maxFilesize;
	private String categoryCode;
	public int getBdNo() {
		return bdNo;
	}
	public void setBdNo(int bdNo) {
		this.bdNo = bdNo;
	}
	public String getOfficialNo() {
		return officialNo;
	}
	public void setOfficialNo(String officialNo) {
		this.officialNo = officialNo;
	}
	public String getBdName() {
		return bdName;
	}
	public void setBdName(String bdName) {
		this.bdName = bdName;
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
	public int getBdOrder() {
		return bdOrder;
	}
	public void setBdOrder(int bdOrder) {
		this.bdOrder = bdOrder;
	}
	public String getUsage() {
		return usage;
	}
	public void setUsage(String usage) {
		this.usage = usage;
	}
	public String getIsReply() {
		return isReply;
	}
	public void setIsReply(String isReply) {
		this.isReply = isReply;
	}
	public String getIsComment() {
		return isComment;
	}
	public void setIsComment(String isComment) {
		this.isComment = isComment;
	}
	public String getIsPrivate() {
		return isPrivate;
	}
	public void setIsPrivate(String isPrivate) {
		this.isPrivate = isPrivate;
	}
	public String getIsUpload() {
		return isUpload;
	}
	public void setIsUpload(String isUpload) {
		this.isUpload = isUpload;
	}
	public int getMaxUpfile() {
		return maxUpfile;
	}
	public void setMaxUpfile(int maxUpfile) {
		this.maxUpfile = maxUpfile;
	}
	public long getMaxFilesize() {
		return maxFilesize;
	}
	public void setMaxFilesize(long maxFilesize) {
		this.maxFilesize = maxFilesize;
	}
	public String getCategoryCode() {
		return categoryCode;
	}
	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}
	@Override
	public String toString() {
		return "BoardVO [bdNo=" + bdNo + ", officialNo=" + officialNo + ", bdName=" + bdName + ", regDate=" + regDate
				+ ", editDate=" + editDate + ", bdOrder=" + bdOrder + ", usage=" + usage + ", isReply=" + isReply
				+ ", isComment=" + isComment + ", isPrivate=" + isPrivate + ", isUpload=" + isUpload + ", maxUpfile="
				+ maxUpfile + ", maxFilesize=" + maxFilesize + ", categoryCode=" + categoryCode + "]";
	}
	
	
	
}
