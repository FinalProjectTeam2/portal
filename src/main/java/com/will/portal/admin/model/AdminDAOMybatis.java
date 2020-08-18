package com.will.portal.admin.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.portal.common.AdminSubjSearchVO;
import com.will.portal.subj_type.model.Subj_typeVO;

@Repository
public class AdminDAOMybatis implements AdminDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.admin.";
	@Override
	public List<Subj_typeVO> subjTypeList() {
		return sqlSession.selectList(namespace+"selectSubType");
	}
	@Override
	public List<AdminOpenSebjVO> selectOpenSubj(AdminSubjSearchVO vo) {
		return sqlSession.selectList(namespace+"selectOpenSubj", vo);
	}
	
	
	
}
