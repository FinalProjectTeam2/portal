package com.will.portal.chat.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.will.portal.common.MemberDetails;

@Component
public class EchoHandler extends TextWebSocketHandler{
	
	private static final Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 맵을 쓸때 방법
		//sessions.put(session.getId(),session)
		// list를 쓸때 방법
		sessionList.add(session);
		logger.info("{} 연결됨!", session.getId());
		
		MemberDetails user = (MemberDetails) ((Authentication)session.getPrincipal()).getPrincipal();
		logger.info("아이디: {} 연결됨!", user.getOfficialNo());
		
		for (WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(user.getName() + "|" + user.getOfficialNo() +"|" + "in"));
		}
		
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("{}로 부터 {} 를 받음",session.getId(),message.getPayload());
		
		MemberDetails user = (MemberDetails) ((Authentication)session.getPrincipal()).getPrincipal();
		
		//연결된 클라이언트에게 모두 전송 : 리스트 방법
		for (WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(user.getName() + "|" + user.getOfficialNo() +"|" + message.getPayload()));
		}
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		
		logger.info("{} 연결 끊김",session.getId());
		MemberDetails user = (MemberDetails) ((Authentication)session.getPrincipal()).getPrincipal();
		logger.info("아이디: {} 연결 종료!", user.getOfficialNo());
		
		for (WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(user.getName() + "|" + user.getOfficialNo() +"|" + "out"));
		}
	}
	
	
	
}
