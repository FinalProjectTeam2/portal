package com.will.portal.board_calender.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/board_calender")
public class CalenderController {

	@RequestMapping(value="/calendarDetail", method = RequestMethod.GET) 
	public String calendarDetail_get() {
		return "board_calender/calendarDetail";
	}
	
}
