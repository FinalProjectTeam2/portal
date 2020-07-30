package com.will.portal.chat.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.will.portal.employee.model.EmployeeVO;
import com.will.portal.professor.model.ProfessorVO;
import com.will.portal.student.model.StudentVO;

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
		String officialNo = session.getPrincipal().getName();
		
		UserDetails user = (UserDetails) ((Authentication)session.getPrincipal()).getPrincipal();
		logger.info("아이디: {} 연결됨!", user.getUsername());
		
		logger.info("pricipal: {} 연결됨!", user);
		
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("{}로 부터 {} 를 받음",session.getId(),message.getPayload());
		String name = "";
		UserDetails user = (UserDetails) ((Authentication)session.getPrincipal()).getPrincipal();
		String num = user.getUsername().substring(4, 5);
		switch (num) {
		case "1":
			name = ((EmployeeVO)user).getName();
			break;
		case "2":
			name = ((ProfessorVO)user).getName();
			break;

		default:
			name = ((StudentVO)user).getName();
			break;
		}
		//연결된 클라이언트에게 모두 전송 : 리스트 방법
		for (WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(name + "|" + user.getUsername() +"|" + message.getPayload()));
		}
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		
		logger.info("{} 연결 끊김",session.getId());
	}
	
	
	
}
