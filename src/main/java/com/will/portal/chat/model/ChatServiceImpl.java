package com.will.portal.chat.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChatServiceImpl implements ChatService{
	@Autowired
	private ChatDAO dao;

	@Override
	public int insertRoom(ChatRoom chatRoom) {
		return dao.insertRoom(chatRoom);
	}

	@Override
	public List<ChatRoom> selectAllRoom() {
		return dao.selectAllRoom();
	}

	@Override
	public ChatRoom selectById(String roomId) {
		return dao.selectById(roomId);
	}
	@Override
	public int countById(String roomId) {
		return dao.countById(roomId);
	}
}
