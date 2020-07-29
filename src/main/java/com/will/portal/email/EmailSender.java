package com.will.portal.email;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

@Component
public class EmailSender {
	@Autowired JavaMailSender mailSender;
	
	public void mailSend(String subject, String content, String receiever, String sender) throws MessagingException {
		MimeMessage mimeMsg = mailSender.createMimeMessage();
		mimeMsg.setSubject(subject);
		mimeMsg.setText(content);
		mimeMsg.setRecipient(RecipientType.TO, new InternetAddress(receiever));
		mimeMsg.setFrom(new InternetAddress(sender));
		mailSender.send(mimeMsg);
		
	}
	

	
}
