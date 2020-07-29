package com.will.portal.common.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.will.portal.department.model.DepartmentService;
import com.will.portal.department.model.DepartmentVO;

@Controller
@RequestMapping("/common")
public class CommonController {

	private static final Logger logger
	= LoggerFactory.getLogger(CommonController.class);
	
	@Autowired DepartmentService departmentService;
	
	//
	@RequestMapping("/departmentList")
	@ResponseBody
	public List<DepartmentVO> departmentList(@RequestParam(defaultValue = "0") int facultyNo){
		logger.info("ajax-departmentList, param: {}",facultyNo);
		
		List<DepartmentVO> departmentList= departmentService.selectDepartmentByFaculty(facultyNo);
		
		return departmentList;
	}
}
