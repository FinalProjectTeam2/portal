package com.will.portal.student.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StudentDAOMybatis implements StudentDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace = "config.mybatis.mapper.oracle.student.";
	
	public String selectPwd(String stuNo) {
		return sqlSession.selectOne(namespace + "selectPwd", stuNo);
	}

	@Override
	public StudentVO selectByStuNo(String stuNo) {
		return sqlSession.selectOne(namespace + "selectByStuNo", stuNo);
	}
}
