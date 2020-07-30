package com.will.portal.authority.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AuthorityDAOMybatis implements AuthorityDAO{

	@Autowired private SqlSessionTemplate sqlSession;
	private String namespce ="config.mybatis.mapper.oracle.authority.";
	
	@Override
	public List<AuthorityVO> selectAuthority() {
		return sqlSession.selectList(namespce+"selectAuthority");
	}
	
}
