package com.will.portal.building.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.will.portal.building.model.BuildingService;
import com.will.portal.building.model.BuildingVO;

@Controller
public class BuildingController {
	private final static Logger logger = LoggerFactory.getLogger(BuildingController.class);
	@Autowired
	private BuildingService buildingService;
	
	@RequestMapping("/campusMap") 
	public String campusMap(Model model) {
		logger.info("캠퍼스맵 보여주기 ");
		List<BuildingVO> list = buildingService.selectAllBuilding();
		model.addAttribute("list",list);
		return "test/campusMap";
	}
	
}
