package com.will.portal.student.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.will.portal.SearchController;
@Controller
@RequestMapping("/student")
public class StudentController {
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	@RequestMapping("/studentEdit/")
	public String edit_get() {
		logger.info("학생 수정화면 페이지 보여주기");
		return "/student/studentEdit";
	}
	
	
}
