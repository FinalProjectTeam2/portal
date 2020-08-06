package com.will.portal.attendance.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.will.portal.tuition.TuitionController;

@Controller
@RequestMapping("/attendance")
public class AttendanceController {
	private static final Logger logger = LoggerFactory.getLogger(AttendanceController.class);
	
	@RequestMapping(value="/attendance", method = RequestMethod.GET) 
	public String attendance_get() {

		return "attendance/attendance";
	}
}
