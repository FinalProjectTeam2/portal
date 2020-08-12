package com.will.portal.certification.model;

import java.sql.Timestamp;

public class CertificationVO {
	private String no;
	private String certCode;
	private int qty;
	private String stuNo;
	private Timestamp regDate;
	private String isPrint;
	private String certName;
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getCertCode() {
		return certCode;
	}
	public void setCertCode(String certCode) {
		this.certCode = certCode;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getStuNo() {
		return stuNo;
	}
	public void setStuNo(String stuNo) {
		this.stuNo = stuNo;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public String getIsPrint() {
		return isPrint;
	}
	public void setIsPrint(String isPrint) {
		this.isPrint = isPrint;
	}
	public String getCertName() {
		return certName;
	}
	public void setCertName(String certName) {
		this.certName = certName;
	}
	
	@Override
	public String toString() {
		return "CertificationVO [no=" + no + ", certCode=" + certCode + ", qty=" + qty + ", stuNo=" + stuNo
				+ ", regDate=" + regDate + ", isPrint=" + isPrint + ", certName=" + certName + "]";
	}
	
	
}
