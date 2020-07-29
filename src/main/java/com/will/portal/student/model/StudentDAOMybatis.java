package com.will.portal.student.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StudentDAOMybatis implements StudentDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace = "config.mybatis.mapper.oracle.student.";
	private String namespaceAdmin="config.mybatis.mapper.oracle.admin.";

	@Override
	public int insertStudent(StudentVO studentVo) {
		return sqlSession.insert(namespaceAdmin+"insertStudent",studentVo);
	}

	public String selectPwd(String stuNo) {
		return sqlSession.selectOne(namespace + "selectPwd", stuNo);
	}

	@Override
	public StudentVO selectByStuNo(String stuNo) {
		return sqlSession.selectOne(namespace + "selectByStuNo", stuNo);
	}

	@Override
	public String selectSsn(String officialNo) {
		return sqlSession.selectOne(namespace+"selectSsn", officialNo);
	}
	
	
}
