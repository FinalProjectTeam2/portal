package com.will.portal.test;

public class test1VO {
	private String custId; 
	private String custName; 
	private String custAge; 
	private String custEmail;
	
	public test1VO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public test1VO(String custId, String custName, String custAge, String custEmail) {
		super();
		this.custId = custId;
		this.custName = custName;
		this.custAge = custAge;
		this.custEmail = custEmail;
	}

	public String getCustId() {
		return custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}

	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public String getCustAge() {
		return custAge;
	}

	public void setCustAge(String custAge) {
		this.custAge = custAge;
	}

	public String getCustEmail() {
		return custEmail;
	}

	public void setCustEmail(String custEmail) {
		this.custEmail = custEmail;
	} 
}
