package com.will.portal.common.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.will.portal.common.MemberDetails;
import com.will.portal.department.model.DepartmentService;
import com.will.portal.department.model.DepartmentVO;
import com.will.portal.employee.model.EmployService;
import com.will.portal.professor.model.ProfessorService;
import com.will.portal.student.model.StudentService;

@Controller
@RequestMapping("/common")
public class CommonController {

	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);

	@Autowired
	DepartmentService departmentService;
	
	@Autowired
	EmployService employService;
	
	@Autowired
	StudentService studentService;
	
	@Autowired
	ProfessorService professorService;

	//
	@RequestMapping("/departmentList")
	@ResponseBody
	public List<DepartmentVO> departmentList(@RequestParam(defaultValue = "0") int facultyNo) {
		logger.info("ajax-departmentList, param: {}", facultyNo);

		List<DepartmentVO> departmentList = departmentService.selectDepartmentByFaculty(facultyNo);

		return departmentList;
	}

	@RequestMapping("/ajax/member")
	@ResponseBody
	public MemberDetails memberByno(@RequestParam String officialNo) {
		String num = officialNo.substring(4, 5);
		logger.info("ajax - member 호출, 파라미터 officialNo={}",officialNo);
		
		MemberDetails user = null;
		
		switch (Integer.parseInt(num)) {
		case 1:
			user = employService.selectByEmpNo(officialNo);
			break;
		case 2:
			user = professorService.selectByProfNo(officialNo);
			break;
		default:
			user = studentService.selectByStuNo(officialNo);
			break;
		}
		
		return user;
	}
}
