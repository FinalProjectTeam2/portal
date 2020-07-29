package com.will.portal.employee.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class EmployeeVO implements UserDetails {
	private String empNo;
	private String pwd;
	private Timestamp startDate;
	private String depCode;
	private String authCode;
	private String empName;
	private Timestamp resignationDate;
	private String identityState;
	private String positionCode;

	private String type = "ADMIN";

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public EmployeeVO() {
		super();
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
	public String toString() {
		return "EmployeeVO [empNo=" + empNo + ", pwd=" + pwd + ", startDate=" + startDate + ", depCode=" + depCode
				+ ", authCode=" + authCode + ", empName=" + empName + ", resignationDate=" + resignationDate
				+ ", identityState=" + identityState + ", positionCode=" + positionCode + "]";
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
		roles.add(new SimpleGrantedAuthority("ROLE_USER"));
		return roles;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return getPwd();
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return getEmpNo();
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}

}
