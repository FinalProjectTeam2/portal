package com.will.portal.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/board")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@RequestMapping("/menu1")
	public String menu1_get() {
		logger.info("寃뚯떆�뙋 硫붿씤�솕硫�");

		return "board/menu1";
	}
	@RequestMapping(value="/menu2", method = RequestMethod.GET) 
	public String menu2_get() {
		return "board/menu2";
	}

	@RequestMapping(value="/write", method = RequestMethod.GET) 
	public String write_get() {
		return "board/write";
	}

	@RequestMapping(value="/detail", method = RequestMethod.GET) 
	public String detail_get() {
		return "board/detail";

	}

	@RequestMapping(value="/edit", method = RequestMethod.GET) 
	public String edit_get() {
		return "board/edit";
	}

	@RequestMapping(value="/delete", method = RequestMethod.GET) 
	public String delete_get() {
		return "board/delete";
	}

	@RequestMapping(value="/re", method = RequestMethod.GET) 
	public String re_get() {
		return "board/re";
	}
	
	@RequestMapping(value="/calendarDetail", method = RequestMethod.GET) 
	public String calendarDetail_get() {
		return "board/calendarDetail";

	}
	
	@RequestMapping(value="/schedule1", method = RequestMethod.GET) public String
	schedule1_get() {

		return "board/schedule1";
	}
	
	
	@RequestMapping(value="/lectureSchedule1", method = RequestMethod.GET) public String
	lectureSchedule1_get() {

		return "board/lectureSchedule1";
	}

	@RequestMapping(value="/privacy1", method = RequestMethod.GET) public String
	privacy1_get() {

		return "board/privacy1";
	}
	
	@RequestMapping(value="/privacy2", method = RequestMethod.GET) public String
	privacy2_get() {
		
		return "board/privacy2";
	}

	@RequestMapping(value="/issueacertificate", method = RequestMethod.GET) public String
	issueacertificate_get() {
		
		return "board/issueacertificate";
	}
	
	@RequestMapping(value="/lectureScheduleLogin", method = RequestMethod.GET) public String
	lectureScheduleLogin_get() {
		
		return "board/lectureScheduleLogin";
	}
}