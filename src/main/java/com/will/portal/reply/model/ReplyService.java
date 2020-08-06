package com.will.portal.reply.model;

import java.util.List;

public interface ReplyService {
	int insertReply(ReplyVO vo);
	int insertRereply(RereplyVO vo);
	List<ReplyAllVO> selectReplyByPostNo(int postNo);
}
