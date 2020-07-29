package com.will.portal.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin/lecture")
public class AdminLectureController {

	private static final Logger logger
	= LoggerFactory.getLogger(AdminLectureController.class);

	@RequestMapping(value = "/adminRegisterLecture", method = RequestMethod.GET)
	public void adminRegisterLecture() {
		logger.info("adminRegisterLecture, GET");
	}
	
	@RequestMapping(value = "/adminManageLecture",method = RequestMethod.GET)
	public void adminManageLec() {
		logger.info("adminManageLecture, Get");
	}
}
