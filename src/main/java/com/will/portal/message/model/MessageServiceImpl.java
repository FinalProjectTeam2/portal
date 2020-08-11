package com.will.portal.message.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageServiceImpl implements MessageService{
	
	@Autowired
	private MessageDAO dao;
	
	@Override
	public int insertInbox(InboxVO vo) {
		return dao.insertInbox(vo);
	}

	@Override
	public int insertOutbox(OutboxVO vo) {
		return dao.insertOutbox(vo);
	}

	@Override
	public int selectCountMsg(String officialNo) {
		return dao.selectCountMsg(officialNo);
	}

	@Override
	public List<MessageAllVO> selectInMsgByOfficialNo(MessageSearchVO vo) {
		return dao.selectInMsgByOfficialNo(vo);
	}
	@Override
	public List<MessageAllVO> selectOutMsgByOfficialNo(MessageSearchVO vo) {
		return dao.selectOutMsgByOfficialNo(vo);
	}
	@Override
	public List<MessageAllVO> selectKeepMsgByOfficialNo(MessageSearchVO vo) {
		return dao.selectKeepMsgByOfficialNo(vo);
	}
	@Override
	public List<MessageAllVO> selectSelfMsgByOfficialNo(MessageSearchVO vo) {
		return dao.selectSelfMsgByOfficialNo(vo);
	}
	@Override
	public List<MessageAllVO> selectAllMsgByOfficialNo(MessageSearchVO vo) {
		return dao.selectAllMsgByOfficialNo(vo);
	}

	@Override
	public int selectInMsgCount(MessageSearchVO vo) {
		return dao.selectInMsgCount(vo);
	}
	@Override
	public int selectOutMsgCount(MessageSearchVO vo) {
		return dao.selectOutMsgCount(vo);
	}

	@Override
	public int selectKeepMsgCount(MessageSearchVO vo) {
		return dao.selectKeepMsgCount(vo);
	}

	@Override
	public int selectSelfMsgCount(MessageSearchVO vo) {
		return dao.selectSelfMsgCount(vo);
	}
	@Override
	public int selectAllMsgCount(MessageSearchVO vo) {
		return dao.selectAllMsgCount(vo);
	}

	@Override
	public MessageAllVO selectByNo(int no) {
		return dao.selectByNo(no);
	}

	@Override
	public int updateReadDateByNo(int no) {
		return dao.updateReadDateByNo(no);
	}

	@Override
	public int deleteInboxByNo(int no) {
		return dao.deleteInboxByNo(no);
	}

	@Override
	public int updateKeepMsg(int no) {
		return dao.updateKeepMsg(no);
	}

}
