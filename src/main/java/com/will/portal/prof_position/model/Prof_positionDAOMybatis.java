package com.will.portal.prof_position.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Prof_positionDAOMybatis implements Prof_positionDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="";
	
}
