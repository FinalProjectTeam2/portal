package com.will.portal.account_info.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Account_InfoDAOMybatis implements Account_InfoDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespceAdmin ="config.mybatis.mapper.oracle.admin.";
	private String namespce ="config.mybatis.mapper.oracle.account_info.";
	
	@Override
	public int insertAccount(String officialNo) {

		return sqlSession.insert(namespceAdmin+"insertAccount",officialNo);
	}

	@Override
	public List<Account_infoVO> selectAllAccount() {
		
		return sqlSession.selectList(namespce+"selectAllAccount");
	}
}
