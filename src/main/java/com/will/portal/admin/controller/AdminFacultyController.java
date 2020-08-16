package com.will.portal.admin.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.will.portal.faculty.model.FacultyService;
import com.will.portal.faculty.model.FacultyVO;

@Controller
@RequestMapping("/admin/faculty")
public class AdminFacultyController {
	private static final Logger logger
	= LoggerFactory.getLogger(AdminFacultyController.class);

	@Autowired
	private FacultyService facultyService;
	
	
	@RequestMapping(value = "/adminManageFaculty")
	public String adminManageFaculty(Model model) {
		List<FacultyVO> facultyList = facultyService.selectFaculty();
		logger.info("adminManageFaculty,");
		
		List<Map<String, Object>> flist = facultyService.selectFacultyView();
		
		model.addAttribute("flist",flist);
		model.addAttribute("facultyList",facultyList);
		return "admin/faculty/adminManageFaculty";
		
	}
	
}
