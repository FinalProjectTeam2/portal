package com.will.portal.professor.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import com.will.portal.common.MemberDetails;

public class ProfessorVO extends MemberDetails {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String profNo;
	private String pwd;
	private String profName;
	private int depNo;
	private int positionNo;
	private Timestamp startDate;
	private Timestamp resignationDate;
	private String identityState;
	private String identifyCode;

	public ProfessorVO() {
		super();
		type = "PROFESSOR";
	}

	public String getProfNo() {
		return profNo;
	}

	public void setProfNo(String profNo) {
		this.profNo = profNo;
		officialNo = profNo;
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
		name = profName;
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
	public String getType() {
		return "PROFESSOR";
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();

		roles.add(new SimpleGrantedAuthority("ROLE_USER"));
		return roles;
	}

	@Override
	public String getPassword() {
		return pwd;
	}

	@Override
	public String getUsername() {
		return profNo;
	}

}
