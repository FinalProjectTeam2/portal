package com.will.portal.tuition.model;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TuitionDAOMybatis implements TuitionDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.tuition.";


	@Override
	public List<TuitionStuVO> selectStu(String officialNo) {
		
		return sqlSession.selectList(namespace+"selectStu");
	}


	@Override
	public List<TuitionVO> selectTuition(String officialNo) {
		
		return sqlSession.selectList(namespace+"selectTuition");
	}


}
