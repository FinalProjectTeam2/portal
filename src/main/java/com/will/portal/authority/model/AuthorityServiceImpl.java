package com.will.portal.authority.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AuthorityServiceImpl implements AuthorityService{

	@Autowired private AuthorityDAO authorityDao;

	@Override
	public List<AuthorityVO> selectAuthority() {
		return authorityDao.selectAuthority();
	}
	
	
}
