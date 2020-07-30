package com.will.portal.emp_depart.model;

import com.will.portal.common.SearchVO;

public class Emp_departVO extends SearchVO {
	private String depCode;
	private String depName;
	
	
	
	public Emp_departVO() {
		super();
	}



	public Emp_departVO(String depCode, String depName) {
		super();
		this.depCode = depCode;
		this.depName = depName;
	}



	public String getDepCode() {
		return depCode;
	}



	public void setDepCode(String depCode) {
		this.depCode = depCode;
	}



	public String getDepName() {
		return depName;
	}



	public void setDepName(String depName) {
		this.depName = depName;
	}



	@Override
	public String toString() {
		return "Emp_departVO [depCode=" + depCode + ", depName=" + depName + "]";
	}
	
}
