package com.will.portal.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin")
public class AdminController {

	private static final Logger logger
	= LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping(value = "/adminRegisterMem", method = RequestMethod.GET)
	public void adminRegisterMem() {
		logger.info("adminRegisterMem, GET");
	}
	
	@RequestMapping(value = "/adminMain",method = RequestMethod.GET)
	public void adminMain() {
		logger.info("adminMain, Get");
	}
	@RequestMapping(value = "/adminManageMem",method = RequestMethod.GET)
	public void adminManageMem() {
		logger.info("adminManageMem, Get");
	}
	@RequestMapping(value = "/adminManageLec",method = RequestMethod.GET)
	public void adminManageLec() {
		logger.info("adminManageLec, Get");
	}
	@RequestMapping(value = "/test",method = RequestMethod.GET)
	public void test() {
		logger.info("test, Get");
	}
}
