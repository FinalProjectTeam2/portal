package com.will.portal.tuition.model;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TuitionDAOMybatis implements TuitionDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.tuition.";

	@Override
	public Map<String, Object> selectStuView(String officicalNo) {
		
		return sqlSession.selectOne(namespace+"selectStuView", officicalNo);
	}

	@Override
	public Map<String, Object> selectTuitionView(String officicalNo) {
		return sqlSession.selectOne(namespace+"selectTuitionView", officicalNo);
	}

	@Override
	public Map<String, Object> selectTuitionDView(String officicalNo) {
		return sqlSession.selectOne(namespace+"selectTuitionDView", officicalNo);
	}
}
