package com.will.portal.prof_position.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Prof_positionDAOMybatis implements Prof_positionDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.prof_position.";
	@Override
	public List<Prof_positionVO> selectProfPosition() {
		return sqlSession.selectList(namespace+"selectProfPosition");
	}
	
	
}
