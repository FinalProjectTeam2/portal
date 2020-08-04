package com.will.portal.chat.controller;

import org.codehaus.jackson.map.ObjectMapper;
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
    private final ObjectMapper objectMapper=  new ObjectMapper();
    private final ChatService chatService;

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        log.info("메세지 전송 = {} : {}",session,message.getPayload());
        String msg = message.getPayload();
        MemberDetails user = (MemberDetails) ((Authentication)session.getPrincipal()).getPrincipal();
        
        ChatMessage chatMessage = objectMapper.readValue(msg,ChatMessage.class);
        chatMessage.setWriterId( user.getOfficialNo());
        chatMessage.setWriterName(user.getName());
        log.info("chatMessage={}",chatMessage);
        
        if(chatMessage.getType().equals("ENTER")) {
        	chatMessage.setMessage(chatMessage.getWriterName()+"("+chatMessage.getWriterId()+")" 
        			+ "님이 입장하셨습니다.");
        }else if(chatMessage.getType().equals("LEAVE")) {
        	chatMessage.setMessage(chatMessage.getWriterName()+"("+chatMessage.getWriterId()+")" 
        			+ "님이 퇴장하셨습니다.");
        }
        int cnt = chatService.insertMessage(chatMessage);
        log.info("메세지 인설트 결과 cnt={}",cnt);
        
        ChatRoom chatRoom = chatRoomRepository.findRoomById(chatMessage.getRoomId());
        chatRoom.handleMessage(session,chatMessage,objectMapper);
    }

}