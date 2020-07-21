package com.will.portal.posts.model;

import java.sql.Timestamp;

public class PostsVO {
	private String postCode;
	private String postNo;
	private String title;
	private String contents;
	private Timestamp regDate;
	private int readCount;
	private String delFlag;
	private int bdCode;
	private String authCode;
	public String getPostCode() {
		return postCode;
	}
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	public String getPostNo() {
		return postNo;
	}
	public void setPostNo(String postNo) {
		this.postNo = postNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public String getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}
	public int getBdCode() {
		return bdCode;
	}
	public void setBdCode(int bdCode) {
		this.bdCode = bdCode;
	}
	public String getAuthCode() {
		return authCode;
	}
	public void setAuthCode(String authCode) {
		this.authCode = authCode;
	}
	@Override
	public String toString() {
		return "PostsVO [postCode=" + postCode + ", postNo=" + postNo + ", title=" + title + ", contents=" + contents
				+ ", regDate=" + regDate + ", readCount=" + readCount + ", delFlag=" + delFlag + ", bdCode=" + bdCode
				+ ", authCode=" + authCode + "]";
	}
	
	
	
	
}
