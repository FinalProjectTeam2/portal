package com.will.portal.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


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
	public String login_post(@RequestParam String stuNo, @RequestParam String pwd,
			@RequestParam (required = false) String saveId,
			HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("로그인 처리, 파라미터 stuNo={}, pwd={}",stuNo,pwd);
		//db처리
		
		return "common/message";
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
	
	@RequestMapping(value = "/inputChgPwd")
	public String inputChgPwd() {
		logger.info("비밀번호 변경 화면 보여주기");
		return "login/inputChgPwd";
	}
	
	@RequestMapping(value = "/adminLogin")
	public String adminLogin() {
		logger.info("비밀번호 변경 화면 보여주기");
		return "login/adminLogin";
	}
	
	@RequestMapping(value = "/findPwdProf")
	public String forProf() {
		logger.info("비밀번호 변경 화면 보여주기");
		return "login/findPwdProf";
	}
	
	@RequestMapping(value = "/chkId", method = RequestMethod.POST)
	@ResponseBody
	public boolean chkId(@RequestParam String stuNo) {
		logger.info("아이디 확인 stuNo = {}", stuNo);
		boolean bool = true;
		//stuNo 존재한다면 true;
		return bool;
		
	}
	
	@RequestMapping(value = "/idnt")
	@ResponseBody
	public boolean idntBt(@RequestParam String name,
			@RequestParam String ssn1,
			@RequestParam String ssn2) {
		logger.info("본인인증 name = {}", name);
		boolean bool = true;

		return bool;
		
	}
}
