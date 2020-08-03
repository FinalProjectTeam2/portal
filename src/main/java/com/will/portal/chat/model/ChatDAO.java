package com.will.portal.chat.model;

import java.util.List;

public interface ChatDAO {
	int insertRoom(ChatRoom chatRoom);
	List<ChatRoom> selectAllRoom();
	ChatRoom selectById(String roomId);
	int countById(String roomId);
}
