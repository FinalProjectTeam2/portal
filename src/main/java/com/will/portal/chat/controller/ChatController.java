package com.will.portal.chat.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ChatController {
	
	private Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	@RequestMapping("/chat/chatMain")
	public void chatMain() {
		
	}
	
	@RequestMapping(value = "/chat/chatting", method = RequestMethod.GET)
	public void websocket() {
		logger.info("채팅 방 보여주기");
	}
}
