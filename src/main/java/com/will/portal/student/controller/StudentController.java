package com.will.portal.student.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.will.portal.SearchController;
import com.will.portal.student.model.StudentService;
@Controller
@RequestMapping("/student")
public class StudentController {
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	@Autowired
	private StudentService studentService;
	
	@RequestMapping("/studentEdit/")
	public String edit_get(HttpServletRequest request, Model model) {
		logger.info("학생 수정화면 페이지 보여주기");
		String officialNo = (String)request.getSession().getAttribute("officialNo");
		
		Map<String, Object> map = studentService.selectViewByStuNo(officialNo);
		model.addAttribute("map", map);
		
		return "/student/studentEdit";
	}
	
	
	
	
}
