package com.will.portal.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {

	private static final Logger logger
	= LoggerFactory.getLogger(AdminController.class);

	@RequestMapping(value = "/admin/adminMain",method = RequestMethod.GET)
	public void adminMain() {
		logger.info("adminMain, Get");
	}
	
	
	@RequestMapping(value = "/admin/test",method = RequestMethod.GET)
	public void test() {
		logger.info("test, Get");
	}
	
}
