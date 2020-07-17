package com.will.portal.faculty.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FacultyDAOMybatis implements FacultyDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="";
}
