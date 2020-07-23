package com.will.portal.posts.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PostsDAOMybatis implements PostsDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.board.";
	@Override
	public PostsAllVO SelectByCode(String postCode) {
		return sqlSession.selectOne(namespace+"SelectByCode", postCode);
	}
	
	
	
}
