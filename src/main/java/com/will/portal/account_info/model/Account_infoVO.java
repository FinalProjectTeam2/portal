package com.will.portal.account_info.model;

public class Account_infoVO {
	private String officialNo;
	private String bankCode;
	private String accountNo;
	private String accountName;
	public String getOfficialNo() {
		return officialNo;
	}
	public void setOfficialNo(String officialNo) {
		this.officialNo = officialNo;
	}
	public String getBankCode() {
		return bankCode;
	}
	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	@Override
	public String toString() {
		return "Account_infoVO [officialNo=" + officialNo + ", bankCode=" + bankCode + ", accountNo=" + accountNo
				+ ", accountName=" + accountName + "]";
	}
	
	
	
}
