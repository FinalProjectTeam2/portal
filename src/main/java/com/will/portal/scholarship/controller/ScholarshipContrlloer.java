package com.will.portal.scholarship.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/scholarship")
public class ScholarshipContrlloer {
	private static final Logger logger = LoggerFactory.getLogger(ScholarshipContrlloer.class);
	 
	@RequestMapping(value="/scholarship1", method = RequestMethod.GET) 
	public String scholarship1_get() {
		logger.info("장학금 신청, 지급 안내 페이지");
		return "scholarship/scholarship1";
	}
	
	@RequestMapping(value="/scholarship2", method = RequestMethod.GET) 
	public String scholarship2_get() {
		logger.info("장학금 신청 페이지");
		return "scholarship/scholarship2";
	}
	
	@RequestMapping(value="/scholarship3", method = RequestMethod.GET) 
	public String scholarship3_get() {
		logger.info("장학금 확인 페이지");
		return "scholarship/scholarship3";
	}
	
	@RequestMapping(value="/scholarship4", method = RequestMethod.GET) 
	public String scholarship4_get() {
		logger.info("장학금 관리 페이지 - 목록");
		return "scholarship/scholarship4";
	}
	
	@RequestMapping(value="/scholarship6", method = RequestMethod.GET) 
	public String scholarship6_get() {
		logger.info("장학금 관리 페이지 - 학생정보(팝업)");
		return "scholarship/scholarship6";
	}
	
	
	@RequestMapping(value="/scholarship5", method = RequestMethod.GET) 
	public String scholarship5_get() {
		logger.info("장학금 관리 페이지 - 글쓰기");
		return "scholarship/scholarship5";
	}
}
