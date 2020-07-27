package com.will.portal.student.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StudentDAOMybatis implements StudentDAO{

	@Autowired SqlSessionTemplate sqlSession;
	private String namespace="";
	private String namespaceAdmin="config.mybatis.mapper.oracle.admin.";

	@Override
	public int insertStudent(StudentVO studentVo) {
		return sqlSession.insert(namespaceAdmin+"insertStudent",studentVo);
	}
	
	
}
