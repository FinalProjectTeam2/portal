package com.will.portal.message.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDAOMybatis implements MessageDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static final String namespace = "config.mybatis.mapper.oracle.message.";
	
	@Override
	public int insertInbox(InboxVO vo) {
		return sqlSession.insert(namespace+"insertInbox", vo);
	}

	@Override
	public int insertOutbox(OutboxVO vo) {
		return sqlSession.insert(namespace+"insertOutbox", vo);
	}

	@Override
	public int selectCountMsg(String officialNo) {
		return sqlSession.selectOne(namespace+"selectCountMsg",officialNo);
	}

	@Override
	public List<MessageAllVO> selectInMsgByOfficialNo(MessageSearchVO vo) {
		return sqlSession.selectList(namespace+"selectInMsgByOfficialNo", vo);
	}
	@Override
	public List<MessageAllVO> selectOutMsgByOfficialNo(MessageSearchVO vo) {
		return sqlSession.selectList(namespace+"selectOutMsgByOfficialNo", vo);
	}
	@Override
	public List<MessageAllVO> selectKeepMsgByOfficialNo(MessageSearchVO vo) {
		return sqlSession.selectList(namespace+"selectKeepMsgByOfficialNo", vo);
	}
	@Override
	public List<MessageAllVO> selectSelfMsgByOfficialNo(MessageSearchVO vo) {
		return sqlSession.selectList(namespace+"selectSelfMsgByOfficialNo", vo);
	}
	@Override
	public List<MessageAllVO> selectAllMsgByOfficialNo(MessageSearchVO vo) {
		return sqlSession.selectList(namespace+"selectAllMsgByOfficialNo", vo);
	}

	@Override
	public int selectInMsgCount(MessageSearchVO vo) {
		return sqlSession.selectOne(namespace+"selectInMsgCount", vo);
	}
	@Override
	public int selectOutMsgCount(MessageSearchVO vo) {
		return sqlSession.selectOne(namespace+"selectOutMsgCount", vo);
	}
	@Override
	public int selectSelfMsgCount(MessageSearchVO vo) {
		return sqlSession.selectOne(namespace+"selectSelfMsgCount", vo);
	}
	@Override
	public int selectKeepMsgCount(MessageSearchVO vo) {
		return sqlSession.selectOne(namespace+"selectKeepMsgCount", vo);
	}
	@Override
	public int selectAllMsgCount(MessageSearchVO vo) {
		return sqlSession.selectOne(namespace+"selectAllMsgCount", vo);
	}

	@Override
	public MessageAllVO selectByNo(int no) {
		return sqlSession.selectOne(namespace+"selectByNo", no);
	}

	@Override
	public int updateReadDateByNo(int no) {
		return sqlSession.update(namespace+"updateReadDateByNo", no);
	}

	@Override
	public int deleteInboxByNo(int no) {
		return sqlSession.delete(namespace+"deleteInboxByNo", no);
	}

	@Override
	public int updateKeepMsg(int no) {
		return sqlSession.update(namespace+"updateKeepMsg", no);
	}

	@Override
	public List<MessageAllVO> selectMainList(String officialNo) {
		return sqlSession.selectList(namespace+"selectMainList", officialNo);
	}
	
	

}
