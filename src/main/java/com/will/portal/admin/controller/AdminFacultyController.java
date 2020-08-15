package com.will.portal.admin.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.will.portal.common.StudentSearchVO;
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
	@RequestMapping("/adminFacultySelectStudent")
	public void adminFacultySelectStudent(@RequestParam(defaultValue = "0") int facultyNo,
			@RequestParam(defaultValue = "0") int major, Model model) {
	
		logger.info("adminFacultySelectStudent,{},{}",facultyNo,major);
		StudentSearchVO studentSearchVo = new StudentSearchVO();
		studentSearchVo.setFacultyNo(facultyNo);
		studentSearchVo.setMajor(major);
		

		SimpleDateFormat format1 = new SimpleDateFormat("yyyy");
		Date time = new Date();
		studentSearchVo.setEndNo(format1.format(time));
		studentSearchVo.setStartNo("1990");
		logger.info("major={},{}",major,studentSearchVo);
		
		List<FacultyVO> flist = new ArrayList<FacultyVO>();
		
		AdminMemberController amc = new AdminMemberController();
		amc.adminManageStudent(studentSearchVo, null, model);
	}
	
}
