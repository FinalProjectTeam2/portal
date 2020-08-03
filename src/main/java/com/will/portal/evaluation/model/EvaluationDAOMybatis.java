package com.will.portal.evaluation.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EvaluationDAOMybatis implements EvaluationDAO{
	@Autowired 
	private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.evaluation.";
	@Override
	public List<EvaluationAllVO> selectAllListforEval(String subCode) {
		return sqlSession.selectList(namespace+"selectAllListforEval", subCode);
	}
	@Override
	public List<Map<String, Object>> subjectByProfNo(String profNo) {
		return sqlSession.selectList(namespace+"subjectByProfNo", profNo);
	}
	
	
	
}
