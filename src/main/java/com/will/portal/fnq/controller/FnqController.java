package com.will.portal.fnq.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FnqController {
	private static final Logger logger 
		= LoggerFactory.getLogger(FnqController.class);
	
	@RequestMapping("/potal/service")
	public String fnq() {
		logger.info("F&Q화면 보여주기");
		return "/potal/service/fnq";
	}
	
}
