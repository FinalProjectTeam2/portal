package com.will.portal.tuition.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TuitionDAOMybatis implements TuitionDAO {
	
	@Autowired private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.tuition.";

	@Override
	public List<TuitionStuVO> selectStuView(String officicalNo) {
		return sqlSession.selectList(namespace+"selectStuView", officicalNo);
	}

	@Override
	public List<TuitionViewVO> selectTuitionView(String officicalNo) {
		return sqlSession.selectList(namespace+"selectTuitionView", officicalNo);
	}

	@Override
	public List<TuitionDetailVO> selectTuitionDView(String officicalNo) {
		return sqlSession.selectList(namespace+"selectTuitionDView", officicalNo);
	}


}
