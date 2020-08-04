package com.will.portal.syllabus.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SyllabusDAOMybatis implements SyllabusDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "config.mybatis.mapper.oracle.syllabus.";

	@Override
	public int insertSyllabus(SyllabusVO vo) {
		return sqlSession.insert(namespace+"insertSyllabus", vo);
	}
	
	
}
