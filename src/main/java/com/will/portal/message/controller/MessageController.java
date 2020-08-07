package com.will.portal.message.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.will.portal.common.MemberDetails;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/message")
public class MessageController {
	
	@GetMapping("/messageBox")
	public void messageBox() {
		log.info("쪽지함 보여주기");
	}
	
	@GetMapping("/sendMessage")
	public void sendMessage(@RequestParam(defaultValue = "send") String type, Authentication authentication,
			Model model) {
		log.info("쪽지 보내기 화면 보여주기, 파라미터 type={}",type);
		MemberDetails user = (MemberDetails) authentication.getPrincipal();
		model.addAttribute("type", type);
		model.addAttribute("user", user);
	}
}
