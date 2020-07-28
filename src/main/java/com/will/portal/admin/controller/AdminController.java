package com.will.portal.admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.will.portal.department.model.DepartmentService;
import com.will.portal.department.model.DepartmentVO;
import com.will.portal.employee.model.EmployService;
import com.will.portal.employee.model.EmployeeVO;
import com.will.portal.faculty.model.FacultyService;
import com.will.portal.faculty.model.FacultyVO;
import com.will.portal.official_info.model.Official_infoVO;
import com.will.portal.prof_position.model.Prof_positionService;
import com.will.portal.prof_position.model.Prof_positionVO;
import com.will.portal.professor.model.ProfessorService;
import com.will.portal.professor.model.ProfessorVO;
import com.will.portal.student.model.StudentService;
import com.will.portal.student.model.StudentVO;

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
	
	@RequestMapping(value = "/adminRegisterMember", method = RequestMethod.GET)
	public String adminRegisterMember(Model model) {
		logger.info("adminRegisterMember, GET");
		
		//학생 select
		List<FacultyVO> facultyList= facultyService.selectFaculty();
		List<DepartmentVO> departmentList=departmentService.selectDepartment();
		List<Prof_positionVO> profPositionList=profPositionService.selectProfPosition();
		
		
		
		logger.info("list.size, {}, {}", facultyList.size(), departmentList.size());
		model.addAttribute("facultyList", facultyList);
		model.addAttribute("departmentList",departmentList);
		model.addAttribute("profPositionList",profPositionList);
		
		return "admin/adminRegisterMember";
				
	}
	
	@RequestMapping("/departmentList")
	@ResponseBody
	public List<DepartmentVO> departmentList(int facultyNo){
		logger.info("ajax-departmentList, param: {}",facultyNo);
		
		List<DepartmentVO> departmentList= departmentService.selectDepartmentByFaculty(facultyNo);
		
		return departmentList;
	}
	
	@RequestMapping(value = "/adminRegisterEmployee",method = RequestMethod.POST)
	public String adminRegisterEmployee_post(@ModelAttribute EmployeeVO employeeVo, 
			@ModelAttribute Official_infoVO officialVo,
			@RequestParam String name, @RequestParam int sort) {
		logger.info("adminRegisterEmployee_post, param: {}",employeeVo);
		logger.info("adminRegisterEmployee_post, param: {}",officialVo);
		logger.info("adminRegisterEmployee_post, param: sort={}",sort);
		
		employeeVo.setEmpName(name);
		int cnt=employeeService.insertEmployee(employeeVo, officialVo, sort);
		
		String url="";
		if(cnt>0) {
			url="admin/adminMain";
			logger.info("adminRegisterEmployee SUCCESS!!");
		}
		
		return url;
	}
	
	@RequestMapping(value = "/adminRegisterProfessor", method = RequestMethod.POST)
	public String adminRegisterProfessor_post(@ModelAttribute ProfessorVO professorVo,
			@ModelAttribute Official_infoVO officialVo,
			@RequestParam String name,@RequestParam int sort) {
		logger.info("adminRegisterProfessor_post, param: {}",professorVo);
		logger.info("adminRegisterProfessor_post, param: {}",officialVo);
		logger.info("adminRegisterProfessor_post, param: name={}",name);
		logger.info("adminRegisterProfessor_post, param: sort={}",sort);
		
		professorVo.setProfName(name);
		logger.info("professorVo.setProfName(name), {}",professorVo);

		int cnt=professorService.insertProfessor(professorVo, officialVo, sort);
		
		String url="";
		if(cnt>0) {
			url="admin/adminMain";
			logger.info("adminRegisterProfessor SUCCESS!!");
		}
		
		return url;
	}
	@RequestMapping(value = "/adminRegisterStudent", method = RequestMethod.POST)
	public String adminRegisterStudent_post(@ModelAttribute StudentVO studentVo,
			@ModelAttribute Official_infoVO officialVo,@RequestParam int depNo,
			@RequestParam int sort) {
		studentVo.setMajor(depNo);
		logger.info("adminRegisterStudent_post, param: {}",studentVo);
		logger.info("adminRegisterStudent_post, param: {}",officialVo);
		logger.info("adminRegisterStudent_post, param: sort={}",sort);
		
		
		int cnt=studentService.insertStudent(studentVo, officialVo, sort);
		
		String url="";
		if(cnt>0) {
			url="admin/adminMain";
			logger.info("adminRegisterStudent SUCCESS!!");
		}
		
		return url;
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
