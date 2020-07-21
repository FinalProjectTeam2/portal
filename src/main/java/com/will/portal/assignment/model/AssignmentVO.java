package com.will.portal.assignment.model;

public class AssignmentVO {
	private String subCode;
	private String stuNo;
	private String classification;
	private String fileName;
	private long fileSize;
	private String originalFileName;
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
	@Override
	public String toString() {
		return "AssignmentVO [subCode=" + subCode + ", stuNo=" + stuNo + ", classification=" + classification
				+ ", fileName=" + fileName + ", fileSize=" + fileSize + ", originalFileName=" + originalFileName + "]";
	}
	
	
	
}
