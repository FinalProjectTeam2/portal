package com.will.portal.reply.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyDAO dao;
	
	@Override
	public int insertReply(ReplyVO vo) {
		return dao.insertReply(vo);
	}

	@Override
	public int insertRereply(RereplyVO vo) {
		return dao.insertRereply(vo);
	}

	@Override
	public List<ReplyAllVO> selectReplyByPostNo(int postNo) {
		return dao.selectReplyByPostNo(postNo);
	}

}
