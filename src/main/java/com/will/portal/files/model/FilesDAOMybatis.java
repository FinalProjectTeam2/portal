package com.will.portal.files.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FilesDAOMybatis implements FilesDAO{
	
	private String namespace = "config.mybatis.mapper.oracle.files.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertFiles(FilesVO vo) {
		return sqlSession.insert(namespace+"insertFiles", vo);
	}

	@Override
	public int selectCountByPostNo(int postNo) {
		return sqlSession.selectOne(namespace+"selectCountByPostNo", postNo);
	}
}
