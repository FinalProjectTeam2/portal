package com.will.portal.email;

import javax.mail.MessagingException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/email")
public class EmailController {
	private static final Logger logger 
		= LoggerFactory.getLogger(EmailController.class);
	@Autowired
	private EmailSender emailSender;
	
	@RequestMapping("/emailTest/")
	public void emailTest() {
		logger.info("emailTest 화면 보여주기");
	}
	
	@RequestMapping("/send/")
	@ResponseBody
	public void send() {
		logger.info("메일발송 처리");

		String subject = "문의에 대한 답변입니다";
		String content = "이메일 내용입니다. 감사합니다";
		String receiever = "shn6314@naver.com";
		String sender = "admin@herbmall.com";
		
		try {
			emailSender.mailSend(subject,content, receiever, sender);
			logger.info("발송성공");
		} catch (MessagingException e) {
			e.printStackTrace();
			logger.info("발송실패");
		}
		
		
	}
}
