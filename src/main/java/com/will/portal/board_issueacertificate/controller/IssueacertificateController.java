package com.will.portal.board_issueacertificate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/board_issueacertificate")
public class IssueacertificateController {

	@RequestMapping(value="/issueacertificate", method = RequestMethod.GET) public String
	issueacertificate_get() {
		
		return "board_issueacertificate/issueacertificate";
	}
}
