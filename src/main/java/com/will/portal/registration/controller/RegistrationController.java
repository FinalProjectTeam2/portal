package com.will.portal.registration.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RegistrationController {
	private static final Logger logger
		= LoggerFactory.getLogger(RegistrationController.class);
	
	@RequestMapping("/registration/main")
	public String register_lec() {
		logger.info("수강신청 뷰페이지 보여주기");
		return "registration/main";
	}
	
	
	
}
