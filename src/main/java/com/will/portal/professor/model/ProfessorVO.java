package com.will.portal.professor.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class ProfessorVO implements UserDetails {
	private String profNo;
	private String pwd;
	private String profName;
	private int depNo;
	private int positionNo;
	private Timestamp startDate;
	private Timestamp resignationDate;
	private String identityState;
	private String identifyCode;

	private String type = "PROFESSOR";

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getProfNo() {
		return profNo;
	}

	public void setProfNo(String profNo) {
		this.profNo = profNo;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getProfName() {
		return profName;
	}

	public void setProfName(String profName) {
		this.profName = profName;
	}

	public int getDepNo() {
		return depNo;
	}

	public void setDepNo(int depNo) {
		this.depNo = depNo;
	}

	public int getPositionNo() {
		return positionNo;
	}

	public void setPositionNo(int positionNo) {
		this.positionNo = positionNo;
	}

	public Timestamp getStartDate() {
		return startDate;
	}

	public void setStartDate(Timestamp startDate) {
		this.startDate = startDate;
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

	public String getIdentifyCode() {
		return identifyCode;
	}

	public void setIdentifyCode(String identifyCode) {
		this.identifyCode = identifyCode;
	}

	@Override
	public String toString() {
		return "ProfessorVO [profNo=" + profNo + ", pwd=" + pwd + ", profName=" + profName + ", depNo=" + depNo
				+ ", positionNo=" + positionNo + ", startDate=" + startDate + ", resignationDate=" + resignationDate
				+ ", identityState=" + identityState + ", identifyCode=" + identifyCode + "]";
	}

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
		return getProfNo();
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
