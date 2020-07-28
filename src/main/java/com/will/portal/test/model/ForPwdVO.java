package com.will.portal.test.model;

public class ForPwdVO {
	private String name;
	private String ssn;
	private int type;
	
	private String officialNo;
	private String pwd;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSsn() {
		return ssn;
	}
	public void setSsn(String ssn) {
		this.ssn = ssn;
	}
	
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getOfficialNo() {
		return officialNo;
	}
	public void setOfficialNo(String officialNo) {
		this.officialNo = officialNo;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	@Override
	public String toString() {
		return "ForPwdVO [name=" + name + ", ssn=" + ssn + ", type=" + type + ", officialNo=" + officialNo + ", pwd="
				+ pwd + "]";
	}
	
	
	
}
