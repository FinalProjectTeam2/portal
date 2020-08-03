package com.will.portal.chat.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChatDAOMybatis implements ChatDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private final String tablespace="config.mybatis.mapper.oracle.chat.";

	@Override
	public int insertRoom(ChatRoom chatRoom) {
		return sqlSession.insert(tablespace+"insertRoom", chatRoom);
	}

	@Override
	public List<ChatRoom> selectAllRoom() {
		return sqlSession.selectList(tablespace+"selectAllRoom");
	}

	@Override
	public ChatRoom selectById(String roomId) {
		return sqlSession.selectOne(tablespace+"selectById", roomId);
	}
	@Override
	public int countById(String roomId) {
		return sqlSession.selectOne(tablespace+"countById", roomId);
	}
}
