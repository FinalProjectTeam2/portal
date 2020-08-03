package com.will.portal.chat.model;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Getter @Setter @ToString
public class ChatRoom {
    private String roomId;
    private String name;
    private String officialNo;
    private Set<WebSocketSession> sessions = new HashSet<>();
    
    public static ChatRoom create(String name, String officialNo){
        ChatRoom chatRoom = new ChatRoom();
        chatRoom.roomId = UUID.randomUUID().toString();
        chatRoom.name = name;
        chatRoom.officialNo = officialNo;
        return chatRoom;
    }

    public void handleMessage(WebSocketSession session, ChatMessage chatMessage,
                              ObjectMapper objectMapper) throws IOException {
        if(chatMessage.getType() == MessageType.ENTER){
            sessions.add(session);
            chatMessage.setMessage(chatMessage.getWriterName()+"("+chatMessage.getWriterId()+")" 
            		+ "님이 입장하셨습니다.");
        }
        else if(chatMessage.getType() == MessageType.LEAVE){
            sessions.remove(session);
            chatMessage.setMessage(chatMessage.getWriterName()+"("+chatMessage.getWriterId()+")" 
            		+ "님이 퇴장하셨습니다.");
        }
        else{
            chatMessage.setMessage(chatMessage.getWriterName() + "|" + chatMessage.getWriterId()
            		+ "|" + chatMessage.getMessage());
        }
        send(chatMessage,objectMapper);
    }

    private void send(ChatMessage chatMessage, ObjectMapper objectMapper) throws IOException {
        TextMessage textMessage = new TextMessage(objectMapper.
                                    writeValueAsString(chatMessage.getMessage()));
        log.info("textMessage={}",textMessage);
        for(WebSocketSession sess : sessions){
            sess.sendMessage(textMessage);
        }
    }
}