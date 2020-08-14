package com.will.portal.assignment.model;

import java.sql.Timestamp;

public class AssignmentVO {
	private int assignNo;
	private String stuNo;
	private String fileName;
	private long fileSize;
	private String originalFileName;
	private Timestamp applyDate;
	public int getAssignNo() {
		return assignNo;
	}
	public void setAssignNo(int assignNo) {
		this.assignNo = assignNo;
	}
	public String getStuNo() {
		return stuNo;
	}
	public void setStuNo(String stuNo) {
		this.stuNo = stuNo;
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
	public Timestamp getApplyDate() {
		return applyDate;
	}
	public void setApplyDate(Timestamp applyDate) {
		this.applyDate = applyDate;
	}
	@Override
	public String toString() {
		return "AssignmentVO [assignNo=" + assignNo + ", stuNo=" + stuNo + ", fileName=" + fileName + ", fileSize="
				+ fileSize + ", originalFileName=" + originalFileName + ", applyDate=" + applyDate + "]";
	}
	
	
	
	
}
