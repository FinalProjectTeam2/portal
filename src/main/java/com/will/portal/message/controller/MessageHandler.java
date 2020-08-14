package com.will.portal.message.controller;

import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.will.portal.common.MemberDetails;
import com.will.portal.message.model.MessageService;
import com.will.portal.message.model.SendVO;

@Component
public class MessageHandler extends TextWebSocketHandler {
	
	@Autowired
	MessageService service;
	
	private static final Logger logger = LoggerFactory.getLogger(MessageHandler.class);
	private Map<String,WebSocketSession> sessionmap = new HashedMap<String, WebSocketSession>();
	private final ObjectMapper objectMapper=  new ObjectMapper();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 맵을 쓸때 방법
		//sessions.put(session.getId(),session)
		// list를 쓸때 방법
		MemberDetails user = (MemberDetails) ((Authentication)session.getPrincipal()).getPrincipal();
		sessionmap.put(user.getOfficialNo(),session);
		logger.info("아이디: {} 연결됨!", user.getOfficialNo());
		
		int count = service.selectCountMsg(user.getOfficialNo());
		session.sendMessage(new TextMessage(Integer.toString(count)));
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("메세지 전송 = {} : {}",session,message.getPayload());
		SendVO vo = objectMapper.readValue(message.getPayload(),SendVO.class);
		String officialNo = vo.getOfficialNo();
		String[] offiSplit = {};
		if(officialNo.indexOf(',') != -1) {
			offiSplit = officialNo.split(",");
    		logger.info("offiLeng={}",offiSplit.length);
    		for (String str : offiSplit) {
    			int count = service.selectCountMsg(str);
        		WebSocketSession sess = sessionmap.get(str);
        		if(sess != null) {
        			sess.sendMessage(new TextMessage(Integer.toString(count)));
        		}
			}
		}else {
    		int count = service.selectCountMsg(officialNo);
    		WebSocketSession sess = sessionmap.get(officialNo);
    		if(sess != null) {
    			sess.sendMessage(new TextMessage(Integer.toString(count)));
    		}
		}
    	
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		MemberDetails user = (MemberDetails) ((Authentication)session.getPrincipal()).getPrincipal();
		logger.info("아이디: {} 연결 종료!", user.getOfficialNo());
		sessionmap.remove(user.getOfficialNo(),session);
	}
}
