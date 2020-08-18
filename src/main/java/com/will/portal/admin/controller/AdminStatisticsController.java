package com.will.portal.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/statistics")
public class AdminStatisticsController {

	private static final Logger logger
	= LoggerFactory.getLogger(AdminStatisticsController.class);
	
	@RequestMapping("/statisticsMain")
	public void statisticsMain() {
		logger.info("statisticsMain");
	}
}
