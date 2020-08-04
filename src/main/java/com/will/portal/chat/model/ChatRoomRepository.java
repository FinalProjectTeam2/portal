package com.will.portal.chat.model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class ChatRoomRepository {
    private Map<String, ChatRoom> chatRoomMap;
    @Autowired
    private ChatService chatService;
    
    @PostConstruct
    private void init(){
        chatRoomMap = new LinkedHashMap<>();
        List<ChatRoom> list = chatService.selectAllRoom();
        for (ChatRoom chatRoom : list) {
        	chatRoomMap.put(chatRoom.getRoomId(), chatRoom);
		}
    }

    public List<ChatRoom> findAllRoom(){
    	List<ChatRoom> chatRooms = new ArrayList<>(chatRoomMap.values());
        Collections.reverse(chatRooms);
        return chatRooms;
    }

    public ChatRoom findRoomById(String id){
        return chatRoomMap.get(id);
    }

    public ChatRoom createChatRoom(String name, String officialNo){
    	ChatRoom chatRoom =null;
    	int check  = 0;
    	while (true) {
        	chatRoom = ChatRoom.create(name, officialNo);
        	check  = chatService.countById(chatRoom.getRoomId());
        	if(check == 0) {
        		break;
        	}
		}
        int cnt = chatService.insertRoom(chatRoom);
        log.info("room insert 결과 cnt={}",cnt);
        chatRoomMap.put(chatRoom.getRoomId(), chatRoom);
        return chatRoom;
    }
}