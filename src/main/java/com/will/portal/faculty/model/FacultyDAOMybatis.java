package com.will.portal.faculty.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FacultyDAOMybatis implements FacultyDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.faculty.";
	@Override
	public List<FacultyVO> selectFaculty() {
		return sqlSession.selectList(namespace +"selectFaculty");
	}
	
	
}
