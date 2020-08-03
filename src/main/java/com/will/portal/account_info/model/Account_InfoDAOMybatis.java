package com.will.portal.account_info.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class Account_InfoDAOMybatis implements Account_InfoDAO{
	private final SqlSessionTemplate sqlSession;
	private String namespceAdmin ="config.mybatis.mapper.oracle.admin.";
	
	@Override
	public int insertAccount(String officialNo) {

		return sqlSession.insert(namespceAdmin+"insertAccount",officialNo);
	}
}
