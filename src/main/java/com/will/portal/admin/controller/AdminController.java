package com.will.portal.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.will.portal.employee.model.EmployeeVO;
import com.will.portal.official_info.model.Official_infoVO;

@Controller
@RequestMapping("/admin")
public class AdminController {

	private static final Logger logger
	= LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping(value = "/adminRegisterMember", method = RequestMethod.GET)
	public void adminRegisterMember() {
		logger.info("adminRegisterMember, GET");
	}
	
	@RequestMapping(value = "/adminRegisterMemberEmployee",method = RequestMethod.POST)
	public String adminRegisterMember_post(@ModelAttribute EmployeeVO employeeVo, 
			@ModelAttribute Official_infoVO officialVo) {
		logger.info("adminRegisterMember_post, param: {}",employeeVo);
		logger.info("adminRegisterMember_post, param: {}",officialVo);
		
		
		employeeVo.setPwd("0000");
		
		
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
