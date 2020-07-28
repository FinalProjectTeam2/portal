package com.will.portal.posts.model;

import java.sql.Timestamp;

public class PostsVO {
	private int postNo;
	private String officialNo;
	private String title;
	private String contents;
	private Timestamp regDate;
	private int readCount;
	private String delFlag;
	private String bdCode;
	private int groupNo;
	private int sortNo;
	private int step;

	private int newImgTerm;

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public String getOfficialNo() {
		return officialNo;
	}

	public void setOfficialNo(String officialNo) {
		this.officialNo = officialNo;
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

	public String getBdCode() {
		return bdCode;
	}

	public void setBdCode(String bdCode) {
		this.bdCode = bdCode;
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

	public int getNewImgTerm() {
		return newImgTerm;
	}

	public void setNewImgTerm(int newImgTerm) {
		this.newImgTerm = newImgTerm;
	}

	@Override
	public String toString() {
		return "PostsVO [postNo=" + postNo + ", officialNo=" + officialNo + ", title=" + title + ", contents="
				+ contents + ", regDate=" + regDate + ", readCount=" + readCount + ", delFlag=" + delFlag + ", bdCode="
				+ bdCode + ", groupNo=" + groupNo + ", sortNo=" + sortNo + ", step=" + step + ", newImgTerm="
				+ newImgTerm + "]";
	}

}
