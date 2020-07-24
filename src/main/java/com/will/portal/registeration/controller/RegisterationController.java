package com.will.portal.registeration.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/registeration")
public class RegisterationController {
	private static final Logger logger
		= LoggerFactory.getLogger(RegisterationController.class);
	
	@RequestMapping("/regi_lec/")
	public String register_lec() {
		logger.info("수강신청 뷰페이지 보여주기");
		return "registeration/regi_lec";
	}
	
	
	
}
