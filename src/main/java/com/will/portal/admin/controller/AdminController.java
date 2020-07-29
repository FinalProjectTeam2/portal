package com.will.portal.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.will.portal.authority.model.AuthorityService;
import com.will.portal.department.model.DepartmentService;
import com.will.portal.emp_depart.model.Emp_departService;
import com.will.portal.emp_position.model.Emp_positionService;
import com.will.portal.employee.model.EmployService;
import com.will.portal.faculty.model.FacultyService;
import com.will.portal.prof_position.model.Prof_positionService;
import com.will.portal.professor.model.ProfessorService;
import com.will.portal.student.model.StudentService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	private static final Logger logger
	= LoggerFactory.getLogger(AdminController.class);
	
	@Autowired EmployService employeeService;
	@Autowired ProfessorService professorService;
	@Autowired DepartmentService departmentService;
	@Autowired FacultyService facultyService;
	@Autowired Prof_positionService profPositionService;
	@Autowired StudentService studentService;
	@Autowired Emp_departService empDepartService;
	@Autowired AuthorityService authorityService;
	@Autowired Emp_positionService empPositionService;
	
	
	@RequestMapping(value = "/adminMain",method = RequestMethod.GET)
	public void adminMain() {
		logger.info("adminMain, Get");
	}
	
	
	@RequestMapping(value = "/test",method = RequestMethod.GET)
	public void test() {
		logger.info("test, Get");
	}
	
	
}
