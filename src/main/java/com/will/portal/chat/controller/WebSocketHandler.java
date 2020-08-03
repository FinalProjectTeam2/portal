package com.will.portal.chat.controller;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.will.portal.chat.model.ChatMessage;
import com.will.portal.chat.model.ChatRoom;
import com.will.portal.chat.model.ChatRoomRepository;
import com.will.portal.chat.model.ChatService;
import com.will.portal.common.MemberDetails;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@RequiredArgsConstructor
public class WebSocketHandler extends TextWebSocketHandler {
    private final ChatRoomRepository chatRoomRepository;
    private final ChatService chatService;
    private final ObjectMapper objectMapper=  new ObjectMapper();

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        log.info("메세지 전송 = {} : {}",session,message.getPayload());
        String msg = message.getPayload();
        MemberDetails user = (MemberDetails) ((Authentication)session.getPrincipal()).getPrincipal();
        
        ChatMessage chatMessage = objectMapper.readValue(msg,ChatMessage.class);
        chatMessage.setWriterId( user.getOfficialNo());
        chatMessage.setWriterName(user.getName());
        log.info("chatMessage={}",chatMessage);
        
        
        
        ChatRoom chatRoom = chatRoomRepository.findRoomById(chatMessage.getRoomId());
        chatRoom.handleMessage(session,chatMessage,objectMapper);
    }

}