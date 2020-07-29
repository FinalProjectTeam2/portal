package com.will.portal.lecture.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
