package com.will.portal.admin.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;

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

import com.will.portal.account_info.model.Account_infoVO;
import com.will.portal.authority.model.AuthorityService;
import com.will.portal.authority.model.AuthorityVO;
import com.will.portal.bank.model.BankService;
import com.will.portal.bank.model.BankVO;
import com.will.portal.common.FileUploadUtil;
import com.will.portal.common.PaginationInfo;
import com.will.portal.common.ProfSearchVO;
import com.will.portal.common.StudentSearchVO;
import com.will.portal.common.Utility;
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
import com.will.portal.official_info.model.Official_infoService;
import com.will.portal.official_info.model.Official_infoVO;
import com.will.portal.prof_position.model.Prof_positionService;
import com.will.portal.prof_position.model.Prof_positionVO;
import com.will.portal.professor.model.ProfessorListVO;
import com.will.portal.professor.model.ProfessorService;
import com.will.portal.professor.model.ProfessorVO;
import com.will.portal.student.model.StudentListVO;
import com.will.portal.student.model.StudentService;
import com.will.portal.student.model.StudentVO;
import com.will.portal.student_state.model.Student_stateService;
import com.will.portal.student_state.model.Student_stateVO;

@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {

	private static final Logger logger = LoggerFactory.getLogger(AdminMemberController.class);

	@Autowired
	EmployService employeeService;
	@Autowired
	ProfessorService professorService;
	@Autowired
	DepartmentService departmentService;
	@Autowired
	FacultyService facultyService;
	@Autowired
	Prof_positionService profPositionService;
	@Autowired
	StudentService studentService;
	@Autowired
	Student_stateService studentStateService;
	@Autowired
	Emp_departService empDepartService;
	@Autowired
	AuthorityService authorityService;
	@Autowired
	Emp_positionService empPositionService;
	@Autowired
	BankService bankService;
	@Autowired
	FileUploadUtil fileUploadUtil;
	@Autowired
	Official_infoService offiService;

	/**
	 * 회원등록 - 뷰
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/adminRegisterMember", method = RequestMethod.GET)
	public String adminRegisterMember(@RequestParam(defaultValue = "0") int sort, Model model) {
		logger.info("adminRegisterMember, GET");

		List<FacultyVO> facultyList = facultyService.selectFaculty();
		List<DepartmentVO> departmentList = departmentService.selectDepartment();
		List<Prof_positionVO> profPositionList = profPositionService.selectProfPosition();
		List<Emp_departVO> empDepartList = empDepartService.selectEmpDepart();
		List<AuthorityVO> authorityList = authorityService.selectAuthority();
		List<Emp_positionVO> empPositionList = empPositionService.selectEmpPosition();

		logger.info("list.size, {}, {}", facultyList.size(), departmentList.size());
		model.addAttribute("facultyList", facultyList);
		model.addAttribute("departmentList", departmentList);
		model.addAttribute("profPositionList", profPositionList);
		model.addAttribute("empDepartList", empDepartList);
		model.addAttribute("authorityList", authorityList);
		model.addAttribute("empPositionList", empPositionList);

		return "admin/member/adminRegisterMember";

	}

	/**
	 * 회원등록 - 직원
	 * 
	 * @param employeeVo
	 * @param officialVo
	 * @param email3
	 * @param name
	 * @param sort
	 * @return
	 */
	@RequestMapping(value = "/adminRegisterEmployee", method = RequestMethod.POST)
	public String adminRegisterEmployee_post(@ModelAttribute EmployeeVO employeeVo,
			@ModelAttribute Official_infoVO officialVo, @RequestParam(required = false) String email3,
			@RequestParam String name, @RequestParam int sort) {
		logger.info("adminRegisterEmployee_post, param: {}", employeeVo);
		logger.info("adminRegisterEmployee_post, param: {}", officialVo);
		logger.info("adminRegisterEmployee_post, param: sort={}", sort);

		employeeVo.setEmpName(name);
		if (officialVo.getEmail2().equals("etc")) {
			officialVo.setEmail2(email3);
		}
		int cnt = employeeService.insertEmployee(employeeVo, officialVo, sort);
		String url = "";
		if (cnt > 0) {
			url = "admin/adminMain";
			logger.info("adminRegisterEmployee SUCCESS!!");
		}

		return url;
	}

	/**
	 * 회원등록 - 교수
	 * 
	 * @param professorVo
	 * @param officialVo
	 * @param email3
	 * @param name
	 * @param sort
	 * @return
	 */
	@RequestMapping(value = "/adminRegisterProfessor", method = RequestMethod.POST)
	public String adminRegisterProfessor_post(@ModelAttribute ProfessorVO professorVo,
			@ModelAttribute Official_infoVO officialVo, @RequestParam(required = false) String email3,
			@RequestParam String name, @RequestParam int sort) {
		logger.info("adminRegisterProfessor_post, param: {}", professorVo);
		logger.info("adminRegisterProfessor_post, param: {}", officialVo);
		logger.info("adminRegisterProfessor_post, param: name={}", name);
		logger.info("adminRegisterProfessor_post, param: sort={}", sort);

		professorVo.setProfName(name);
		logger.info("professorVo.setProfName(name), {}", professorVo);

		if (officialVo.getEmail2().equals("etc")) {
			officialVo.setEmail2(email3);
		}
		int cnt = professorService.insertProfessor(professorVo, officialVo, sort);

		String url = "";
		if (cnt > 0) {
			url = "admin/adminMain";
			logger.info("adminRegisterProfessor SUCCESS!!");
		}

		return url;
	}

	/**
	 * 회원등록 - 학생
	 * 
	 * @param studentVo
	 * @param officialVo
	 * @param depNo
	 * @param sort
	 * @param email3
	 * @return
	 */
	@RequestMapping(value = "/adminRegisterStudent", method = RequestMethod.POST)
	public String adminRegisterStudent_post(@ModelAttribute StudentVO studentVo,
			@ModelAttribute Official_infoVO officialVo, @RequestParam int depNo, @RequestParam int sort,
			@RequestParam(required = false) String email3) {
		studentVo.setMajor(depNo);
		logger.info("adminRegisterStudent_post, param: {}", studentVo);
		logger.info("adminRegisterStudent_post, param: {}", officialVo);
		logger.info("adminRegisterStudent_post, param: sort={}", sort);

		if (officialVo.getEmail2().equals("etc")) {
			officialVo.setEmail2(email3);
		}
		int cnt = studentService.insertStudent(studentVo, officialVo, sort);

		String url = "";
		if (cnt > 0) {
			url = "admin/adminMain";
			logger.info("adminRegisterStudent SUCCESS!!");
		}

		return url;
	}

	/**
	 * 회원관리 - 학생
	 * 
	 * @param searchVo
	 * @param state
	 * @param model
	 */
	@RequestMapping("/adminManageStudent")
	public void adminManageStudent(@ModelAttribute StudentSearchVO studentSearchVo,
			@RequestParam(required = false) String state, Model model) {
		logger.info("adminManageStudent, param:state={}, {}", state, studentSearchVo);

		// select 생성
		List<FacultyVO> facultyList = facultyService.selectFaculty();
		List<DepartmentVO> departmentList = departmentService.selectDepartment();
		if (state != null) {
			String[] slist = state.split(",");
			setState(studentSearchVo, slist);
		}
		List<Student_stateVO> stateList = studentStateService.selectStudentState();

		// paging 처리 관련
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setCurrentPage(studentSearchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);

		studentSearchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		studentSearchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

		logger.info("list.size, {}, {}", facultyList.size(), departmentList.size());
		model.addAttribute("facultyList", facultyList);
		model.addAttribute("departmentList", departmentList);
		model.addAttribute("stateList", stateList);
		
		// db
		List<Map<String, Object>> list = studentService.selectStudentView(studentSearchVo);
		logger.info("학생  조회 결과, list.size={}", list.size());

		int totalRecord = studentService.getTotalRecord(studentSearchVo);
		logger.info("학생조회 레코드 개수 : {}", totalRecord);

		pagingInfo.setTotalRecord(totalRecord);

		model.addAttribute("studentSearchVo", studentSearchVo);
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
	}

	/**
	 * 체크박스 조건 설정
	 * 
	 * @param studentSearchVo
	 * @param slist
	 * @param idx
	 */
	private void setState(StudentSearchVO studentSearchVo, String[] slist) {
		int idx = slist.length;
		studentSearchVo.setState1(slist[0]);
		idx--;
		if (idx < 1)
			return;
		studentSearchVo.setState2(slist[1]);
		idx--;
		if (idx < 1)
			return;
		studentSearchVo.setState3(slist[2]);
		idx--;
		if (idx < 1)
			return;
		studentSearchVo.setState4(slist[3]);
		idx--;
		if (idx < 1)
			return;
		studentSearchVo.setState5(slist[4]);
		idx--;
		if (idx < 1)
			return;
		studentSearchVo.setState6(slist[5]);
		idx--;
		if (idx < 1)
			return;
	}

	/**
	 * 회원관리 - 교수
	 * 
	 * @param searchVo
	 * @param position
	 * @param model
	 */
	@RequestMapping("/adminManageProfessor")
	public void adminManageProfessor(@ModelAttribute ProfSearchVO profSearchVo,
			@RequestParam(required = false) String position, Model model) {
		logger.info("adminManageProfessor, param: position={},  {}", position, profSearchVo);

		// for select 생성
		List<FacultyVO> facultyList = facultyService.selectFaculty();
		List<DepartmentVO> departmentList = departmentService.selectDepartment();
		if (position != null && !position.isEmpty()) {
			String[] slist = position.split(",");
			setPosition(profSearchVo, slist);
		}
		List<Prof_positionVO> profPositionList = profPositionService.selectProfPosition();

		// paging 처리 관련
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setCurrentPage(profSearchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);

		profSearchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		profSearchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

		logger.info("list.size, {}, {}", facultyList.size(), departmentList.size());
		model.addAttribute("facultyList", facultyList);
		model.addAttribute("departmentList", departmentList);
		model.addAttribute("profPositionList", profPositionList);

		// db
		List<Map<String, Object>> list = professorService.selectProfessorView(profSearchVo);
		logger.info("교수  조회 결과, list.size={}", list.size());

		int totalRecord = professorService.getTotalRecord(profSearchVo);
		logger.info("교수조회 레코드 개수 : {}", totalRecord);

		pagingInfo.setTotalRecord(totalRecord);

		model.addAttribute("profSearchVo", profSearchVo);
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
	}

	/**
	 * 체크박스 조건 설정 - 교수 직책
	 * 
	 * @param studentSearchVo
	 * @param slist
	 * @param idx
	 */
	private void setPosition(ProfSearchVO profSearchVo, String[] slist) {
		int idx = slist.length;
		
		profSearchVo.setPositionNo1(slist[0]);
		idx--;
		if (idx < 1)
			return;
		profSearchVo.setPositionNo2(slist[1]);
		idx--;
		if (idx < 1)
			return;
		profSearchVo.setPositionNo3(slist[2]);
		idx--;
		if (idx < 1)
			return;
		profSearchVo.setPositionNo4(slist[3]);
		idx--;
		if (idx < 1)
			return;
		profSearchVo.setPositionNo5(slist[4]);
		idx--;
		if (idx < 1)
			return;
	}

	/**
	 * 회원관리 - 직원
	 * 
	 * @param searchVo
	 * @param authority
	 * @param empPosition
	 * @param model
	 */
	@RequestMapping("/adminManageEmployee")
	public void adminManageEmployee(@ModelAttribute Emp_departVO searchVo,
			@RequestParam(required = false) String authority, @RequestParam(required = false) String empPosition,
			Model model) {
		logger.info("adminManageEmployee, param: {}", searchVo);
		logger.info("adminManageEmployee, param: authority={}, empPosition={}", authority, empPosition);

		// for select 생성
		List<Emp_departVO> empDepartList = empDepartService.selectEmpDepart();
		List<AuthorityVO> authorityList = authorityService.selectAuthority();
		List<Emp_positionVO> empPositionList = empPositionService.selectEmpPosition();

		// paging 처리 관련
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(10);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(10);

		searchVo.setRecordCountPerPage(10);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

		model.addAttribute("empDepartList", empDepartList);
		model.addAttribute("authorityList", authorityList);
		model.addAttribute("empPositionList", empPositionList);

	}

	/**
	 * 
	 * @param userid
	 */
	@RequestMapping(value = "/adminEditMember", method = RequestMethod.GET)
	public void adminEditMember(String userid) {
		logger.info("adminEditMember, Get");
	}

	@RequestMapping(value = "/multiUpdateState")
	public String multiUpdateState(@RequestParam(name = "states") String state,
			@ModelAttribute StudentListVO studentList, Model model) {
		List<StudentVO> list = studentList.getStuList();
		logger.info("studentCheck = {}", state);
		logger.info("list.size = {}", list.size());

		for (StudentVO studentVO : list) {
			logger.info("studentVo = {}", studentVO);
		}

		int cnt = studentService.multiUpdateStudentState(list, state);
		logger.info("cnt = {}", cnt);
		String msg = "학적상태 변경 실패", url = "/admin/member/adminManageStudent";
		if (cnt > 0) {
			msg = "학적상태 변경 성공";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}
	
	@RequestMapping("/multiUpdateposition")
	public String multiUpdateposition(@RequestParam String positionNo,
			@ModelAttribute ProfessorListVO profList, Model model) {
		
		logger.info("profList={}positionNo={}",profList,positionNo);
		List<ProfessorVO> list = profList.getProfList();
		int cnt = professorService.mutiUpdatePosition(list, Integer.parseInt(positionNo));
		
		logger.info("cnt = {}", cnt);
		String msg = "학적상태 변경 실패", url = "/admin/member/adminManageProfessor";
		if (cnt > 0) {
			msg = "학적상태 변경 성공";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
		
	}
	
	@RequestMapping(value = "/multiDelete")
	public String multiDeleteStudent(@ModelAttribute StudentListVO studentList, Model model) {
		List<StudentVO> list = studentList.getStuList();
		int cnt = studentService.deleteMulti(list);

		String msg = "학생 삭제 실패", url = "/admin/member/adminManageStudent";
		if (cnt > 0) {
			msg = "학생 삭제 성공";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}
	
	@RequestMapping(value = "/multiDeleteProfessor")
	public String multiDeleteProfessor(@ModelAttribute ProfessorListVO profList, Model model) {
		List<ProfessorVO> list = profList.getProfList();
		int cnt = professorService.multiDelete(list);
		
		String msg = "교수 삭제 실패", url = "/admin/member/adminManageProfessor";
		if (cnt > 0) {
			msg = "교수 삭제 성공";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}
	
	@RequestMapping("/deleteStudent")
	public String deleteStudent(String stuNo, Model model) {
		int cnt = studentService.deleteStudent(stuNo);

		String msg = "삭제 실패", url = "/admin/member/adminManageStudent";
		if (cnt > 0) {
			msg = "삭제 성공";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}
	@RequestMapping("/deleteProfessor")
	public String deleteProfessor(String profNo, Model model) {
		int cnt = professorService.deleteProfessor(profNo);
		
		String msg = "삭제 실패", url = "/admin/member/adminManageProfessor";
		if (cnt > 0) {
			msg = "삭제 성공";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
		
	}
	

	@RequestMapping(value = "/memberEdit", method = RequestMethod.POST)
	@ResponseBody
	public boolean edit_post(@RequestParam String officialNo, Model model, @ModelAttribute Account_infoVO accInfoVo,
			@ModelAttribute Official_infoVO offiVo, @RequestParam String hp, @RequestParam String email,
			@RequestParam(required = false) String oldFileName, HttpServletRequest request) {
		boolean bool = false;

		accInfoVo.setOfficialNo(officialNo);
		offiVo.setOfficialNo(officialNo);
		String[] emailarr = email.split("@");
		String email1 = emailarr[0], email2 = emailarr[1];
		String[] hparr = hp.split("-");
		String hp1 = hparr[0], hp2 = hparr[1], hp3 = hparr[2];
		offiVo.setEmail1(email1);
		offiVo.setEmail2(email2);
		offiVo.setHp1(hp1);
		offiVo.setHp2(hp2);
		offiVo.setHp3(hp3);

		// 파일 업로드 처리
		List<Map<String, Object>> fileList = fileUploadUtil.fileUpload(request, FileUploadUtil.PATH_IMAGE);

		String NewfileName = "";
		for (Map<String, Object> map : fileList) {
			NewfileName = (String) map.get("fileName");
			offiVo.setImageUrl(NewfileName);
		}

		if (offiVo.getImageUrl() != null && !offiVo.getImageUrl().isEmpty()) {
			if (oldFileName != null && !oldFileName.isEmpty()) {
				File oldFile = new File(fileUploadUtil.getUploadPath(request, FileUploadUtil.PATH_IMAGE), oldFileName);
				logger.info("oldFile={}", oldFile.getName());
				if (oldFile.exists()) {
					boolean deletefile = oldFile.delete();
					logger.info("파일삭제 여부 : {}", deletefile);
				}
			}
		}

		int cnt1 = bankService.updateAccount(accInfoVo);
		int cnt2 = offiService.updateOfficialInfo(offiVo);
		if (cnt1 > 0 && cnt2 > 0) {
			bool = true;
		}

		logger.info("oldFileName = {}", oldFileName);
		logger.info("bool = {}", bool);
		return bool;
	}

	@RequestMapping("/selectInfo")
	@ResponseBody
	public Map<String, Object> body(String officialNo, HttpServletRequest request) {
		logger.info("officialNo={}", officialNo);
		String num = officialNo.substring(4, 5);
		String type = "";

		if (num.equals("1")) {
			type = "ADMIN";
		} else if (num.equals("2")) {
			type = "PROFESSOR";
		} else if (num.equals("3")) {
			type = "STUDENT";
		}

		logger.info("type={}", type);

		Map<String, Object> map = studentService.selectViewByStuNo(officialNo);
		if (type.equals("STUDENT")) {
			map = studentService.selectViewByStuNo(officialNo);
		} else if (type.equals("PROFESSOR")) {
			map = professorService.selectViewByProfNo(officialNo);
		} else if (type.equals("ADMIN")) {
			map = employeeService.selectViewByEmpNo(officialNo);
		}

		logger.info("map={}", map);

		if (map.get("ZIPCODE") == null) {
			map.put("ZIPCODE", "");
		}
		if (map.get("ADDRESS") == null) {
			map.put("ADDRESS", "");
		}
		if (map.get("ADDR_DETAIL") == null) {
			map.put("ADDR_DETAIL", "");
		}
		if (map.get("ADDRESS") == null) {
			map.put("ADDRESS", "");
		}
		if (map.get("ACCOUNT_NO") == null) {
			map.put("ACCOUNT_NO", "");
			map.put("ACCOUNT_NAME", "");
		}
		if (map.get("ACCOUNT_NAME") == null) {
			map.put("ACCOUNT_NAME", "");
		}

		String uploadPath = fileUploadUtil.getUploadPath(request, FileUploadUtil.PATH_IMAGE);
		map.put("uploadPath", uploadPath + "\\" + map.get("IMAGE_URL"));
		logger.info("uploadPath={}", map.get("uploadPath"));
		logger.info("IMAGE_URL={}", map.get("IMAGE_URL"));

		map.put("type", type);
		return map;
		// C:\lecture\java\workspace_list\final_ws\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\portal\pd_images
		// C:\lecture\java\workspace_list\final_ws\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\portal\pd_images\hsLogo_20200731160018585.png
	}

	@RequestMapping(value = "/memberEdit", method = RequestMethod.GET)
	public String edit_get(String officialNo, Model model) {
		logger.info("수정화면 페이지 보여주기, officialNo={}", officialNo);
		List<BankVO> bankList = bankService.selectAllBank();
		model.addAttribute("bankList", bankList);
		model.addAttribute("officialNo", officialNo);

		return "/admin/member/adminEditMember";
	}

}
