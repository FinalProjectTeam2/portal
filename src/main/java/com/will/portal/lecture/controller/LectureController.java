package com.will.portal.lecture.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LectureController {
	private static final Logger logger = LoggerFactory.getLogger(LectureController.class);
	
	@RequestMapping("/lecture/openLecture_bak")
	public void openLecture_bak() {
		logger.info("교수 과목 등록 페이지");
	}
	
	@RequestMapping("/lecture/openLecture")
	public void openLecture() {
		logger.info("교수 과목 등록 페이지");
		
	}
	
	@RequestMapping(value = "/lecture/addSubject", method = RequestMethod.POST)
	public void addSubject(@RequestParam String subject, @RequestParam String time, 
			@RequestParam(defaultValue = "0") int credit, HttpSession session, Model model) {
		logger.info("입력한 과목 처리 페이지");
		
	}
	
	
}
