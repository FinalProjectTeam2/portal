package com.will.portal.reply.model;

import java.util.List;

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

	@Override
	public List<ReplyAllVO> selectReplyByPostNo(int postNo) {
		return sqlSession.selectList(namespace+"selectReplyByPostNo", postNo);
	}

}
