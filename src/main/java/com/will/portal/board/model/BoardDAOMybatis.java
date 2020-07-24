package com.will.portal.board.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOMybatis implements BoardDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="";
}
