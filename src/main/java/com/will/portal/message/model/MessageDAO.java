package com.will.portal.message.model;

import java.util.List;

public interface MessageDAO {
	int insertInbox(InboxVO vo);
	int insertOutbox(OutboxVO vo);
	int selectCountMsg(String officialNo);
	List<MessageAllVO> selectInMsgByOfficialNo(MessageSearchVO vo);
	List<MessageAllVO> selectOutMsgByOfficialNo(MessageSearchVO vo);
	List<MessageAllVO> selectKeepMsgByOfficialNo(MessageSearchVO vo);
	List<MessageAllVO> selectSelfMsgByOfficialNo(MessageSearchVO vo);
	List<MessageAllVO> selectAllMsgByOfficialNo(MessageSearchVO vo);
	int selectInMsgCount(MessageSearchVO vo);
	int selectOutMsgCount(MessageSearchVO vo);
	int selectKeepMsgCount(MessageSearchVO vo);
	int selectSelfMsgCount(MessageSearchVO vo);
	int selectAllMsgCount(MessageSearchVO vo);
	MessageAllVO selectByNo(int no);
	int updateReadDateByNo(int no);
	int deleteInboxByNo(int no);
	int updateKeepMsg(int no);
	List<MessageAllVO> selectMainList(String officialNo);
}
