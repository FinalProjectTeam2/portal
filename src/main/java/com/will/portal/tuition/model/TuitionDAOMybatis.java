package com.will.portal.tuition.model;

import java.util.List;

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

	@Override
	public int insertTuition(TuitionDetailVO dVo) {
		return sqlSession.insert(namespace+"insertTuition", dVo);
	}

	@Override
	public int updateTuition(TuitionDetailVO dVo) {
		return sqlSession.update(namespace+"updateTuition", dVo);
	}

	@Override
	public int deleteTuition(String officicalNo) {
		return sqlSession.delete(namespace+"deleteTuition", officicalNo);
	}

	@Override
	public int selectByNo(int no) {
		return sqlSession.selectOne(namespace+"selectByNo", no);
	}


}
