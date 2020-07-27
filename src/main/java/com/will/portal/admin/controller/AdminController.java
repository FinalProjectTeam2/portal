package com.will.portal.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.will.portal.employee.model.EmployService;
import com.will.portal.employee.model.EmployeeVO;
import com.will.portal.official_info.model.Official_infoVO;
import com.will.portal.professor.model.ProfessorService;
import com.will.portal.professor.model.ProfessorVO;

@Controller
@RequestMapping("/admin")
public class AdminController {

	private static final Logger logger
	= LoggerFactory.getLogger(AdminController.class);
	
	@Autowired EmployService employeeService;
	@Autowired ProfessorService professorService;
	
	@RequestMapping(value = "/adminRegisterMember", method = RequestMethod.GET)
	public void adminRegisterMember() {
		logger.info("adminRegisterMember, GET");
	}
	
	@RequestMapping(value = "/adminRegisterEmployee",method = RequestMethod.POST)
	public String adminRegisterEmployee_post(@ModelAttribute EmployeeVO employeeVo, 
			@ModelAttribute Official_infoVO officialVo, @RequestParam int sort) {
		logger.info("adminRegisterEmployee_post, param: {}",employeeVo);
		logger.info("adminRegisterEmployee_post, param: {}",officialVo);
		logger.info("adminRegisterEmployee_post, param: sort={}",sort);
		
		int cnt=employeeService.insertEmployee(employeeVo, officialVo, sort);
		
		String url="";
		if(cnt>0) {
			url="admin/adminMain";
			logger.info("adminRegisterMember SUCCESS!!");
		}
		
		return url;
	}
	@RequestMapping(value = "/adminRegisterProfessor", method = RequestMethod.POST)
	public String adminRegisterProfessor_post(@ModelAttribute ProfessorVO professorVo,
			@ModelAttribute Official_infoVO officialVo, @RequestParam int sort) {
		logger.info("adminRegisterProfessor_post, param: {}",professorVo);
		logger.info("adminRegisterProfessor_post, param: {}",officialVo);
		logger.info("adminRegisterProfessor_post, param: sort={}",sort);
		
		//int cnt = professorService
		return null;
	}
	
	
	@RequestMapping(value = "/adminRegisterLecture", method = RequestMethod.GET)
	public void adminRegisterLecture() {
		logger.info("adminRegisterLecture, GET");
	}
	
	@RequestMapping(value = "/adminMain",method = RequestMethod.GET)
	public void adminMain() {
		logger.info("adminMain, Get");
	}
	@RequestMapping(value = "/adminManageMember",method = RequestMethod.GET)
	public void adminManageMember() {
		logger.info("adminManageMember, Get");
	}
	@RequestMapping(value = "/adminManageLecture",method = RequestMethod.GET)
	public void adminManageLec() {
		logger.info("adminManageLecture, Get");
	}
	@RequestMapping(value = "/test",method = RequestMethod.GET)
	public void test() {
		logger.info("test, Get");
	}
	
	
}
