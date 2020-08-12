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
		List<BuildingVO> allList = buildingService.selectAllBuilding();
		
		List<BuildingVO> mediList = buildingService.selectDong("의대동");
		List<BuildingVO> gongList = buildingService.selectDong("공과대학동");
		List<BuildingVO> inmoonList = buildingService.selectDong("인문사회동");
		List<BuildingVO> scienceList = buildingService.selectDong("자연과학동");
		List<BuildingVO> artList = buildingService.selectDong("예술대학동");
		List<BuildingVO> mainList = buildingService.selectDong("본관");
		List<BuildingVO> buildingName = buildingService.selectBuildingName();
		
		model.addAttribute("allList",allList);
		model.addAttribute("mediList",mediList);
		model.addAttribute("gongList",gongList);
		model.addAttribute("inmoonList",inmoonList);
		model.addAttribute("scienceList",scienceList);
		model.addAttribute("artList",artList);
		model.addAttribute("mainList",mainList);
		model.addAttribute("buildingName",buildingName);
		
		return "/campusMap";
	}
}
