package com.will.portal.files.model;

import java.sql.Timestamp;

public class FilesVO {
	private int no;
	private String postCode;
	private String fileName;
	private long fileSize;
	private String originalFileName;
	private int downCount;
	private Timestamp upfileDate;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getPostCode() {
		return postCode;
	}
	public void setPostCode(String postCode) {
		this.postCode = postCode;
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
		return "FilesVO [no=" + no + ", postCode=" + postCode + ", fileName=" + fileName + ", fileSize=" + fileSize
				+ ", originalFileName=" + originalFileName + ", downCount=" + downCount + ", upfileDate=" + upfileDate
				+ "]";
	}
	
	
}
