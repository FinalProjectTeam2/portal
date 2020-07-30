package com.will.portal.common;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public abstract class MemberDetails extends SearchVO implements UserDetails {
	/**
	 * 
	 */
	protected static final long serialVersionUID = 1L;
	protected String type;
	protected String officialNo;
	protected String name;

	public abstract String getType();
	
	public String getOfficialNo() {
		return officialNo;
	}

	public void setOfficialNo(String officialNo) {
		this.officialNo = officialNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public abstract Collection<? extends GrantedAuthority> getAuthorities();

	@Override
	public abstract String getPassword();

	@Override
	public abstract String getUsername();

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

}
