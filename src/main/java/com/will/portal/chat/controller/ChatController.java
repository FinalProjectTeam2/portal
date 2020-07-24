package com.will.portal.chat.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@ServerEndpoint(value="/echo")
public class ChatController {
	 private static final List<Session> sessionList=new ArrayList<Session>();
	 private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	 
	 public ChatController() {
		 logger.info("웹소켓(서버) 객체 생성");
	 }
	 
	 @RequestMapping("/chat")
	 public String getChatViewPage(Model model) {
		 return "/chat";
	 }
	 
	 @OnOpen
	 public void onOpen(Session session) {
		 logger.info("Open session id : " + session.getId());

		 try {
			 final Basic basic = session.getBasicRemote();
			 basic.sendText("Connection Established!");
		 } catch (IOException e) {
			 // TODO Handle Exception
			 e.printStackTrace();
		 }
		 sessionList.add(session);
	 }
	 
	 private void sendAllSessionToMessage(Session self, String message) {
		 try {
			 for(Session session : ChatController.sessionList) {
				 if(!self.getId().equals(session.getId())) {
					 session.getBasicRemote().sendText(message.split(",")[1]+" : " +message);
				 }
			 }
		 } catch (IOException e) {
			 // TODO handle exception
			 e.printStackTrace();
		 }
	 }
	 
	 @OnMessage
	 public void onMessage(String message, Session session) {
		 logger.info("Message From " + message.split(",")[1] + ": "+message.split(",")[0]);
		 
		 try {
			 final Basic basic = session.getBasicRemote();
			 basic.sendText("to : " + message);
		 } catch (IOException e) {
			 // TODO Auto-generated catch block
			 e.printStackTrace();
		 }
		 sendAllSessionToMessage(session, message);
	 }
	 @OnError
	 public void onError(Throwable e, Session session) {
		 
	 }
	 
	 public void onClose(Session session) {
		 logger.info("Session " + session.getId()+" has ended");
		 sessionList.remove(session);
	 }
}
