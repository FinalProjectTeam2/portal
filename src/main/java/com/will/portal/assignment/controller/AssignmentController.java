package com.will.portal.assignment.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/assignment")
public class AssignmentController {
	private static final Logger logger = LoggerFactory.getLogger(AssignmentController.class);
	
	@RequestMapping(value="/assignment1",method = RequestMethod.GET) 
	public String assignment1_get() {
		return "assignment/assignment1";
	}
	
	@RequestMapping(value="/assignment2",method = RequestMethod.GET) 
	public String assignment2_get() {
		return "assignment/assignment2";
	}
}
