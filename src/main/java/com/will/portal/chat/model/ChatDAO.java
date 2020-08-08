package com.will.portal.chat.model;

import java.util.List;

public interface ChatDAO {
	int insertRoom(ChatRoom chatRoom);
	List<ChatRoom> selectAllRoom();
	ChatRoom selectById(String roomId);
	int countById(String roomId);
	int insertMessage(ChatMessage message);
	List<ChatMessage> selectMessage(String roomId);
	int deleteRoom(String roomId);
}
