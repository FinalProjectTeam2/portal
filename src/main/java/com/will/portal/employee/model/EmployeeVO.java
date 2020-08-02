package com.will.portal.employee.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import com.will.portal.common.MemberDetails;

public class EmployeeVO extends MemberDetails {
	private static final long serialVersionUID = 1L;
	private String empNo;
	private String pwd;
	private Timestamp startDate;
	private String depCode;
	private String authCode;
	private String empName;
	private Timestamp resignationDate;
	private String identityState;
	private String positionCode;

	public EmployeeVO() {
		super();
		type = "ADMIN";
	}

	public String getPositionCode() {
		return positionCode;
	}

	public void setPositionCode(String positionCode) {
		this.positionCode = positionCode;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
		officialNo = empNo;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public Timestamp getStartDate() {
		return startDate;
	}

	public void setStartDate(Timestamp startDate) {
		this.startDate = startDate;
	}

	public String getDepCode() {
		return depCode;
	}

	public void setDepCode(String depCode) {
		this.depCode = depCode;
	}

	public String getAuthCode() {
		return authCode;
	}

	public void setAuthCode(String authCode) {
		this.authCode = authCode;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
		name = empName;
	}

	public Timestamp getResignationDate() {
		return resignationDate;
	}

	public void setResignationDate(Timestamp resignationDate) {
		this.resignationDate = resignationDate;
	}

	public String getIdentityState() {
		return identityState;
	}

	public void setIdentityState(String identityState) {
		this.identityState = identityState;
	}


	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
		roles.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
		return roles;
	}

	@Override
	public String getType() {
		return "ADMIN";
	}

	@Override
	public String getPassword() {
		return pwd;
	}

	@Override
	public String getUsername() {
		return empNo;
	}


}
