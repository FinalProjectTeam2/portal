package com.will.portal.bank.model;

public class BankVO {
	private String bankCode;
	private String bankName;
	public String getBankCode() {
		return bankCode;
	}
	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	@Override
	public String toString() {
		return "BankVO [bankCode=" + bankCode + ", bankName=" + bankName + "]";
	}
	
	
}
