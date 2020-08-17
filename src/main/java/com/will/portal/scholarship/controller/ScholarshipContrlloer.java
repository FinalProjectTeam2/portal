package com.will.portal.scholarship.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.will.portal.common.MemberDetails;
import com.will.portal.common.PaginationInfo;
import com.will.portal.common.SearchVO;
import com.will.portal.common.StudentSearchVO;
import com.will.portal.common.Utility;
import com.will.portal.department.model.DepartmentService;
import com.will.portal.department.model.DepartmentVO;
import com.will.portal.faculty.model.FacultyService;
import com.will.portal.faculty.model.FacultyVO;
import com.will.portal.scholarship.model.ScholarshipAllVO;
import com.will.portal.scholarship.model.ScholarshipService;
import com.will.portal.student.model.StudentService;
import com.will.portal.student_state.model.Student_stateService;
import com.will.portal.student_state.model.Student_stateVO;
import com.will.portal.tuition.model.TuitionDetailVO;
import com.will.portal.tuition.model.TuitionService;
import com.will.portal.tuition.model.TuitionStuVO;

@Controller
@RequestMapping("/scholarship")
public class ScholarshipContrlloer {
	private static final Logger logger = LoggerFactory.getLogger(ScholarshipContrlloer.class);
	 
	@Autowired ScholarshipService scholarshipService;
	@Autowired TuitionService tuitionService;
	@Autowired FacultyService facultyService;
	@Autowired DepartmentService departmentService;
	@Autowired StudentService studentService;
	@Autowired Student_stateService studentStateService;
	
	@RequestMapping("/scholarship") 
	public String scholarship(Principal principal,  Model model) {
		MemberDetails user = (MemberDetails) ((Authentication)principal).getPrincipal();
		String officicalNo = user.getOfficialNo(); 
		
		System.out.println(officicalNo);
		System.out.println("장학금 확인 페이지");

		List<ScholarshipAllVO> list = scholarshipService.selectAllScholarship(officicalNo);
		System.out.println("목록 확인 결과 list="+ list.size());
		
		model.addAttribute("list", list);
		

		return "scholarship/scholarship";
	}
	
	/**
	 장학금
	 *
	 * @param searchVo
	 * @param state
	 * @param model
	 */
	@RequestMapping("/scholarshipList")
	public void scholarshipList(@ModelAttribute StudentSearchVO studentSearchVo,
			@RequestParam(required = false) String state, Model model) {
		logger.info("adminManageStudent, param:state={}, {}", state, studentSearchVo);

		// select 생성
		List<FacultyVO> facultyList = facultyService.selectFaculty();
		List<DepartmentVO> departmentList = departmentService.selectDepartmentByFaculty(studentSearchVo.getFacultyNo());
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
		logger.info("{}",departmentList);
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
		model.addAttribute("state",state);
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
	

	// 장학금 등록 
	@RequestMapping(value = "/scholarshipWrite", method = RequestMethod.GET)
	public String scholarshipWrite_get() {
		System.out.println("장학금 관리 - 등록 화면");
		
		return "scholarship/scholarshipWrite";
	}
	
	@RequestMapping(value = "/scholarshipWrite", method = RequestMethod.POST)
	public String scholarshipWrite_post(Principal principal, @ModelAttribute ScholarshipAllVO vo, Model model) {
		System.out.println("장학금 등록 화면");
		MemberDetails user = (MemberDetails)((Authentication)principal).getPrincipal();
		String officicalNo=user.getOfficialNo();
		
		List<ScholarshipAllVO> list = scholarshipService.selectAllScholarship(officicalNo);
		List<FacultyVO> facultyList = facultyService.selectFaculty();
		
		vo.setStuNo(officicalNo);
		
		int cnt = scholarshipService.insertscholarship(vo);
		System.out.println("등록 결과 cnt="+cnt);
		
		String msg = "장학금 등록에 실패하였습니다.", url="/scholarship/scholarshipWrite";
		if(cnt > 0) {
			msg = "장학금 등록 성공에 성공하였습니다.";
			url = "/scholarship/scholarshipList";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
		 
		
	// 장학금 수정
	@RequestMapping(value="/scholarshipEdit", method=RequestMethod.GET)
	public String scholarshipEdit_get(@RequestParam(defaultValue = "0") int no,  Model model) {
		System.out.println("장학금 수정 파라미터  no=" + no);
		
		if(no==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/scholarship/list.do");
			
			return "common/message";
		}
		
		ScholarshipAllVO vo= scholarshipService.selectByNo(no);
		System.out.println("장학금 수정 조회 결과 vo=" + vo);
		
		model.addAttribute("vo", vo);

		return "scholarship/scholarshipEdit";
	}
	
	@RequestMapping(value="/scholarshipEdit", method=RequestMethod.POST)
	public String scholarshipEdit_post(@ModelAttribute ScholarshipAllVO vo, Model model) {
		System.out.println("수정 파라미터 vo=" + vo);

		String msg="장학금 수정 실패", url="/scholarship/scholarshipEdit.do?no="+vo.getNo();
		int cnt=scholarshipService.updatescholarship(vo);
		if(cnt>0) {
			msg="장학금 수정 처리되었습니다";
			url="/scholarship/scholarshipDetail.do?no="+vo.getNo();
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	// 장학금 삭제 
	@RequestMapping(method = RequestMethod.GET)
	public String scholarshipDel_get(@RequestParam(defaultValue="0") int no, Model model) {
		//1
		logger.info("삭제 화면, 파라미터 no={}", no);
		if(no==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/board/list.do");
			
			return "common/message";
		}
		
		return "scholarship/scholarshipDel_get";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String scholarshipDel_post(@ModelAttribute ScholarshipAllVO vo, Model model) {
		System.out.println("삭제 파라미터 vo="+vo);

		String msg="글 삭제 실패", url="/scholarship/scholarshipDel.do?no="+vo.getNo();

		int cnt=scholarshipService.deleteScholarship(vo.getNo());
		if(cnt>0) {
			msg="글삭제 처리되었습니다";
			url="/scholarship/scholarshipList";
		}		

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4
		return "common/message";
	}
	
}
