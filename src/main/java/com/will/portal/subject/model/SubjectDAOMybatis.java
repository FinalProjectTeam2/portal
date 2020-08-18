package com.will.portal.subject.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.portal.open_subj.model.Open_subjVO;
import com.will.portal.subj_type.model.Subj_typeVO;

@Repository
public class SubjectDAOMybatis implements SubjectDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace= "config.mybatis.mapper.oracle.subject.";
	@Override
	public List<Subj_typeVO> selectType() {
		return sqlSession.selectList(namespace+"selectType");
	}
	@Override
	public int subjectSeq() {
		return sqlSession.selectOne(namespace+"subjectSeq");
	}
	@Override
	public int insertSubject(SubjectVO vo) {
		return sqlSession.insert(namespace+"insertSubject", vo);
	}
	@Override
	public int insertOpenSubj(Open_subjVO vo) {
		return sqlSession.insert(namespace+"insertOpenSubj", vo);
	}
	@Override
	public int updateCloseDate(String openSubCode) {
		return sqlSession.update(namespace+"updateCloseDate",openSubCode);
	}
	
	
	
	
	
	
}
