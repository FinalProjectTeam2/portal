package com.will.portal.board_disclosure.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/board_disclosure")
public class DisclosureController {
	@RequestMapping(value="/disclosureInformation", method = RequestMethod.GET) public String
	disclosureInformation_get() {
		
		return "board_disclosure/disclosureInformation";
	}
	
	@RequestMapping(value="/disclosureInformation2", method = RequestMethod.GET) public String
	disclosureInformation2_get() {
		
		return "board_disclosure/disclosureInformation2";
	}
	
	
	@RequestMapping(value="/privacy1", method = RequestMethod.GET) public String
	privacy1_get() {

		return "board_disclosure/privacy1";
	}
	
	@RequestMapping(value="/privacy2", method = RequestMethod.GET) public String
	privacy2_get() {
		
		return "board_disclosure/privacy2";
	}

}
