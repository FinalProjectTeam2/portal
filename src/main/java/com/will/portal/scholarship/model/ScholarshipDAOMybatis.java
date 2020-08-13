package com.will.portal.scholarship.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ScholarshipDAOMybatis implements ScholarshipDAO {
	private String namespace = "config.mybatis.mapper.oracle.scholarship.";
	
	@Autowired private SqlSessionTemplate sqlSession;

	@Override
	public List<ScholarshipVO> selectAllScholarship() {
		return sqlSession.selectList(namespace+"selectAllScholarship");
	}
	
}
