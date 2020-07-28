package com.will.portal.tuition;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.will.portal.board.controller.BoardController;

@Controller
@RequestMapping("/Tuition")
public class TuitionController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@RequestMapping(value="/tuition1", method = RequestMethod.GET) 
	public String tuition1_get() {
		return "Tuition/tuition1";
	}
	
	
	@RequestMapping(value="/tuition2", method = RequestMethod.GET) 
	public String tuition2_get() {
		return "Tuition/tuition2";
	}
	
	@RequestMapping(value="/tuition3", method = RequestMethod.GET) 
	public String tuition3_get() {
		return "Tuition/tuition3";
	}
	
	@RequestMapping(value="/tuition4", method = RequestMethod.GET) 
	public String tuition4_get() {
		return "Tuition/tuition4";
	}
	
	
}
