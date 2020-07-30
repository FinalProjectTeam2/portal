package com.will.portal.tuition.model;

import java.sql.Timestamp;

public class TuitionAllVO {
	
	private Timestamp deposit_date;
	private String bank_name;
	private String account_no;
	private int total;
	private String deposit_state;
	private String bank_code;
	
	public TuitionAllVO(Timestamp deposit_date, String bank_name, String account_no, int total, String deposit_state,
			String bank_code) {
		super();
		this.deposit_date = deposit_date;
		this.bank_name = bank_name;
		this.account_no = account_no;
		this.total = total;
		this.deposit_state = deposit_state;
		this.bank_code = bank_code;
	}

	public Timestamp getDeposit_date() {
		return deposit_date;
	}

	public void setDeposit_date(Timestamp deposit_date) {
		this.deposit_date = deposit_date;
	}

	public String getBank_name() {
		return bank_name;
	}

	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}

	public String getAccount_no() {
		return account_no;
	}

	public void setAccount_no(String account_no) {
		this.account_no = account_no;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getDeposit_state() {
		return deposit_state;
	}

	public void setDeposit_state(String deposit_state) {
		this.deposit_state = deposit_state;
	}

	public String getBank_code() {
		return bank_code;
	}

	public void setBank_code(String bank_code) {
		this.bank_code = bank_code;
	}

	@Override
	public String toString() {
		return "TuitionAllVO [deposit_date=" + deposit_date + ", bank_name=" + bank_name + ", account_no=" + account_no
				+ ", total=" + total + ", deposit_state=" + deposit_state + ", bank_code=" + bank_code + "]";
	}
	
	
	

}
