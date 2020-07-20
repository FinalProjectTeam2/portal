package com.will.portal.login.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/login")
public class LoginController {
	private static final Logger logger
		= LoggerFactory.getLogger(LoginController.class);

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login_get() {
		logger.info("로그인 화면 보여주기");
		return "login/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login_post() {
		logger.info("로그인 처리 ");
		return "login/login";
	}
	
	@RequestMapping(value = "/findPwd", method = RequestMethod.GET)
	public String findPwd_get() {
		logger.info("로그인 화면 보여주기");
		return "login/findPwd";
	}
	
	@RequestMapping(value = "/findId")
	public String findId() {
		logger.info("로그인 화면 보여주기");
		return "login/findId";
	}
}
