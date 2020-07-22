package com.will.portal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EvaluationController {
	private static final Logger logger = LoggerFactory.getLogger(EvaluationController.class);
	
	@RequestMapping("/evaluation")
	public void Evaluation() {
		
	}
}
