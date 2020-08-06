package com.will.portal.reply.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAOMybatis implements ReplyDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private final String namespace = "config.mybatis.mapper.oracle.reply.";
	
	@Override
	public int insertReply(ReplyVO vo) {
		return sqlSession.insert(namespace+"insertReply", vo);
	}

	@Override
	public int insertRereply(RereplyVO vo) {
		return sqlSession.insert(namespace+"insertRereply", vo);
	}

}
