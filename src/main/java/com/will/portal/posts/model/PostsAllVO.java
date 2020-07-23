package com.will.portal.posts.model;

import java.sql.Timestamp;

public class PostsAllVO {
	private String postCode;
	private String postNo;
	private String title;
	private String contents;
	private Timestamp regDate;
	private int readCount;
	private String delFlag;
	private int bdCode;
	private String authCode;
	private int no;
	private String fileName;
	private long fileSize;
	private String originalFileName;
	private int downCount;
	private Timestamp upfileDate;
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
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public int getDownCount() {
		return downCount;
	}
	public void setDownCount(int downCount) {
		this.downCount = downCount;
	}
	public Timestamp getUpfileDate() {
		return upfileDate;
	}
	public void setUpfileDate(Timestamp upfileDate) {
		this.upfileDate = upfileDate;
	}
	@Override
	public String toString() {
		return "PostsAllVO [postCode=" + postCode + ", postNo=" + postNo + ", title=" + title + ", contents=" + contents
				+ ", regDate=" + regDate + ", readCount=" + readCount + ", delFlag=" + delFlag + ", bdCode=" + bdCode
				+ ", authCode=" + authCode + ", no=" + no + ", fileName=" + fileName + ", fileSize=" + fileSize
				+ ", originalFileName=" + originalFileName + ", downCount=" + downCount + ", upfileDate=" + upfileDate
				+ "]";
	}
	
	
}
