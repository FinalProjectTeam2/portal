package com.will.portal.official_info.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.portal.professor.model.ProfessorVO;
import com.will.portal.student.model.StudentVO;

@Repository
public class Official_infoDAOMybatis implements Official_infoDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.member.";
	
	@Override
	public Official_infoVO selectByNo(String officialNo) {
		return sqlSession.selectOne(namespace+"selectOfficialByNo", officialNo);
	}

	@Override
	public int countStuByNo(String officialNo) {
		return sqlSession.selectOne(namespace+"countStuByNo", officialNo);
	}

	@Override
	public int countProfByNo(String officialNo) {
		return sqlSession.selectOne(namespace+"countProfByNo", officialNo);
	}

	@Override
	public StudentVO selectStuByNo(String officialNo) {
		return sqlSession.selectOne(namespace+"selectStuByNo", officialNo);
	}

	@Override
	public ProfessorVO selectProfByNo(String officialNo) {
		return sqlSession.selectOne(namespace+"selectProfByNo", officialNo);
	}

	@Override
	public int updateCode(StudentVO vo) {
		return sqlSession.update(namespace+"updateCode", vo);
	}

	@Override
	public String selectCode(String stuNo) {
		return sqlSession.selectOne(namespace+"selectCode", stuNo);
	}

	@Override
	public int updateIdentState(String stuNo) {
		return sqlSession.update(namespace+"updateIdentState", stuNo);
	}
	
	
	

	
}