package com.will.portal.statistics.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StatisticsDAOMybatis implements StatisticsDAO{

	private String namespace = "config.mybatis.mapper.oracle.statistics.";
	@Autowired private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, Object>> selectScoreMain() {
		return sqlSession.selectList(namespace+"selectScoreMain");
	}

	@Override
	public List<Map<String, Object>> selectBoardMain() {
		return sqlSession.selectList(namespace+"selectBoardMain");
	}
	
	
	
}
