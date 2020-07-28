package com.will.portal.category.model;

import java.sql.Timestamp;

public class CategoryVO {
	private String categoryCode;
	private String categoryName;
	private String usage;
	private Timestamp regDate;

	public String getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getUsage() {
		return usage;
	}

	public void setUsage(String usage) {
		this.usage = usage;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "CategoryVO [categoryCode=" + categoryCode + ", categoryName=" + categoryName + ", usage=" + usage
				+ ", regDate=" + regDate + "]";
	}

}
