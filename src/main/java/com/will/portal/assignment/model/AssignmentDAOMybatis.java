package com.will.portal.assignment.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AssignmentDAOMybatis implements AssignmentDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.assignment.";
	
	@Override
	public List<Map<String, Object>> subjByStuNo(String stuNo) {
		return sqlSession.selectList(namespace+"subjByStuNo", stuNo);
	}

	@Override
	public List<Distribute_assignVO> getDistAssign(String openSubCode) {
		return sqlSession.selectList(namespace+"getDistAssign", openSubCode);
	}

	@Override
	public int assignUpload(AssignmentVO vo) {
		return sqlSession.insert(namespace+"assignUpload", vo);
	}

	@Override
	public List<Map<String, Object>> assignStuList(Distribute_assignVO vo) {
		return sqlSession.selectList(namespace+"assignStuList", vo);
	}
	
	
	
}
