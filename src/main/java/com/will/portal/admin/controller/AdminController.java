package com.will.portal.admin.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.will.portal.faculty.model.FacultyService;
import com.will.portal.faculty.model.FacultyVO;

@Controller
public class AdminController {

	private static final Logger logger
	= LoggerFactory.getLogger(AdminController.class);

	@Autowired
	private FacultyService facultyService;
	
	@RequestMapping(value = "/admin/adminMain",method = RequestMethod.GET)
	public void adminMain() {
		logger.info("adminMain, Get");
	}
	
	
	@RequestMapping(value = "/admin/test",method = RequestMethod.GET)
	public void test() {
		logger.info("test, Get");
	}
	
	@RequestMapping(value = "/admin/adminManageFaculty")
	public String adminManageFaculty(Model model) {
		List<FacultyVO> facultyList = facultyService.selectFaculty();
		logger.info("adminManageFaculty,");
		
		List<Map<String, Object>> flist = facultyService.selectFacultyView();
		
		model.addAttribute("flist",flist);
		model.addAttribute("facultyList",facultyList);
		return "admin/adminManageFaculty";
		
	}
	
	
}
