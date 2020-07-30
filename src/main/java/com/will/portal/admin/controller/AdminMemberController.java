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

import com.will.portal.authority.model.AuthorityService;
import com.will.portal.authority.model.AuthorityVO;
import com.will.portal.common.PaginationInfo;
import com.will.portal.common.SearchVO;
import com.will.portal.department.model.DepartmentService;
import com.will.portal.department.model.DepartmentVO;
import com.will.portal.emp_depart.model.Emp_departService;
import com.will.portal.emp_depart.model.Emp_departVO;
import com.will.portal.emp_position.model.Emp_positionService;
import com.will.portal.emp_position.model.Emp_positionVO;
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
@RequestMapping("/admin/member")
public class AdminMemberController {
	
	private static final Logger logger
	= LoggerFactory.getLogger(AdminMemberController.class);

	@Autowired EmployService employeeService;
	@Autowired ProfessorService professorService;
	@Autowired DepartmentService departmentService;
	@Autowired FacultyService facultyService;
	@Autowired Prof_positionService profPositionService;
	@Autowired StudentService studentService;
	@Autowired Emp_departService empDepartService;
	@Autowired AuthorityService authorityService;
	@Autowired Emp_positionService empPositionService;
	
	//회원등록 화면 보여주기_GET
	@RequestMapping(value = "/adminRegisterMember", method = RequestMethod.GET)
	public String adminRegisterMember(Model model) {
		logger.info("adminRegisterMember, GET");
		
		List<FacultyVO> facultyList= facultyService.selectFaculty();
		List<DepartmentVO> departmentList=departmentService.selectDepartment();
		List<Prof_positionVO> profPositionList=profPositionService.selectProfPosition();
		List<Emp_departVO> empDepartList=empDepartService.selectEmpDepart();
		List<AuthorityVO> authorityList=authorityService.selectAuthority();
		List<Emp_positionVO> empPositionList=empPositionService.selectEmpPosition();
		
		logger.info("list.size, {}, {}", facultyList.size(), departmentList.size());
		model.addAttribute("facultyList", facultyList);
		model.addAttribute("departmentList",departmentList);
		model.addAttribute("profPositionList",profPositionList);
		model.addAttribute("empDepartList",empDepartList);
		model.addAttribute("authorityList",authorityList);
		model.addAttribute("empPositionList",empPositionList);
		
		
		return "admin/member/adminRegisterMember";
				
	}

	@RequestMapping(value = "/adminRegisterEmployee",method = RequestMethod.POST)
	public String adminRegisterEmployee_post(@ModelAttribute EmployeeVO employeeVo, 
			@ModelAttribute Official_infoVO officialVo,@RequestParam(required = false) String email3,
			@RequestParam String name, @RequestParam int sort) {
		logger.info("adminRegisterEmployee_post, param: {}",employeeVo);
		logger.info("adminRegisterEmployee_post, param: {}",officialVo);
		logger.info("adminRegisterEmployee_post, param: sort={}",sort);
		
		employeeVo.setEmpName(name);
		if(officialVo.getEmail2().equals("etc")) {
			officialVo.setEmail2(email3);
		}
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
			@ModelAttribute Official_infoVO officialVo,@RequestParam(required = false) String email3,
			@RequestParam String name,@RequestParam int sort) {
		logger.info("adminRegisterProfessor_post, param: {}",professorVo);
		logger.info("adminRegisterProfessor_post, param: {}",officialVo);
		logger.info("adminRegisterProfessor_post, param: name={}",name);
		logger.info("adminRegisterProfessor_post, param: sort={}",sort);
		
		professorVo.setProfName(name);
		logger.info("professorVo.setProfName(name), {}",professorVo);

		if(officialVo.getEmail2().equals("etc")) {
			officialVo.setEmail2(email3);
		}
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
			@RequestParam int sort,@RequestParam(required = false) String email3) {
		studentVo.setMajor(depNo);
		logger.info("adminRegisterStudent_post, param: {}",studentVo);
		logger.info("adminRegisterStudent_post, param: {}",officialVo);
		logger.info("adminRegisterStudent_post, param: sort={}",sort);
		
		if(officialVo.getEmail2().equals("etc")) {
			officialVo.setEmail2(email3);
		}
		int cnt=studentService.insertStudent(studentVo, officialVo, sort);
		
		String url="";
		if(cnt>0) {
			url="admin/adminMain";
			logger.info("adminRegisterStudent SUCCESS!!");
		}
		
		return url;
	}
	@RequestMapping(value = "/adminManageMember",method = RequestMethod.GET)
	public void adminManageMember(@RequestParam(defaultValue = "1") int sort, @ModelAttribute SearchVO searchVo,Model model) {
		logger.info("adminManageMember, Get");
		logger.info("adminManageMember, param: sort={}",sort);
		logger.info("adminManageMember, param: {}",searchVo);
		
		//for select 생성
		List<FacultyVO> facultyList= facultyService.selectFaculty();
		List<DepartmentVO> departmentList=departmentService.selectDepartment();
		List<Prof_positionVO> profPositionList=profPositionService.selectProfPosition();
		List<Emp_departVO> empDepartList=empDepartService.selectEmpDepart();
		List<AuthorityVO> authorityList=authorityService.selectAuthority();
		List<Emp_positionVO> empPositionList=empPositionService.selectEmpPosition();
		
		
		//paging 처리 관련
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(10);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(10);
		
		searchVo.setRecordCountPerPage(10);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		logger.info("list.size, {}, {}", facultyList.size(), departmentList.size());
		model.addAttribute("facultyList", facultyList);
		model.addAttribute("departmentList",departmentList);
		model.addAttribute("profPositionList",profPositionList);
		model.addAttribute("empDepartList",empDepartList);
		model.addAttribute("authorityList",authorityList);
		model.addAttribute("empPositionList",empPositionList);
		
		
	}
	
	@RequestMapping(value = "/adminEditMember",method = RequestMethod.GET)
	public void adminEditMember(String userid) {
		logger.info("adminEditMember, Get");
		
	}
	
}
