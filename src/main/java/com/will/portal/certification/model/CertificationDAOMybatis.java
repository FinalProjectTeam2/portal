package com.will.portal.certification.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CertificationDAOMybatis implements CertificationDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.certification.";
	
	@Override
	public int getSeq() {
		return sqlSession.selectOne(namespace+"getSeq");
	}

	@Override
	public int insertCert(CertificationVO vo) {
		return sqlSession.insert(namespace+"insertCert", vo);
	}

	@Override
	public List<CertificationVO> selectByStuNo(String stuNo) {
		return sqlSession.selectList(namespace+"selectByStuNo", stuNo);
	}

	@Override
	public CertificationVO selectByNo(String no) {
		return sqlSession.selectOne(namespace+"selectByNo", no);
	}

	@Override
	public int updateIsPrint(String no) {
		return sqlSession.update(namespace+"updateIsPrint",no);
	}
	
	
	
	
	
}
