package com.will.portal.tuition;

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
import com.will.portal.common.StudentSearchVO;
import com.will.portal.common.Utility;
import com.will.portal.department.model.DepartmentService;
import com.will.portal.department.model.DepartmentVO;
import com.will.portal.faculty.model.FacultyService;
import com.will.portal.faculty.model.FacultyVO;
import com.will.portal.student.model.StudentService;
import com.will.portal.student_state.model.Student_stateService;
import com.will.portal.student_state.model.Student_stateVO;
import com.will.portal.tuition.model.TuitionDetailVO;
import com.will.portal.tuition.model.TuitionService;
import com.will.portal.tuition.model.TuitionStuVO;
import com.will.portal.tuition.model.TuitionViewVO;


@Controller
@RequestMapping("/tuition")
public class TuitionController {
	private static final Logger logger = LoggerFactory.getLogger(TuitionController.class);
	
	@Autowired TuitionService tuitionService;
	@Autowired FacultyService facultyService;
	@Autowired DepartmentService departmentService;
	@Autowired StudentService studentService;
	@Autowired Student_stateService studentStateService;

	@RequestMapping(value="/tuition1", method = RequestMethod.GET) 
	public String tuition1_get() {
		logger.info("납부 안내");
		return "tuition/tuition1";
	}
	
	@RequestMapping(value="/tuition3", method = RequestMethod.GET) 
	public String tuition5_get() {
		logger.info("영수증 보여주기");
		return "tuition/tuition3";
	}
	
	// 등록금 회원 - 목록
	@RequestMapping("/tuition2") 
	public String tuition2(Principal principal,  Model model) {
		MemberDetails user = (MemberDetails) ((Authentication)principal).getPrincipal();
		String officicalNo = user.getOfficialNo();
		
		System.out.println(officicalNo);
		
		System.out.println("목록");
		List<TuitionStuVO> stuList = tuitionService.selectStuView(officicalNo);
		List<TuitionViewVO> tList = tuitionService.selectTuitionView(officicalNo);
		List<TuitionDetailVO> tDList = tuitionService.selectTuitionDView(officicalNo);
		
		for(TuitionStuVO vo: stuList) {
			System.out.println(vo);
		}
		
		System.out.println("목록 확인 결과 stuList="+ stuList.size());
		System.out.println("목록 확인 결과 tList="+ tList.size());
		System.out.println("목록 확인 결과 tDList="+ tDList.size());
		model.addAttribute("stuList", stuList);
		model.addAttribute("tList", tList);
		model.addAttribute("tDList", tDList);

		return "tuition/tuition2";
	}
	
	// 등록금 관리 - 등록 
	@RequestMapping(value = "/tuitionWrite", method = RequestMethod.GET)
	public String tuitionWrite_get() {
		System.out.println("등록금 관리 - 등록 화면");
		
		return "tuition/tuitionWrite";
	}
	
	@RequestMapping(value = "/tuitionWrite", method = RequestMethod.POST)
	public String tuitionWrite_post(Principal principal, @ModelAttribute TuitionDetailVO vo, Model model) {
		System.out.println("등록금 등록 화면");
		MemberDetails user = (MemberDetails)((Authentication)principal).getPrincipal();
		String officicalNo=user.getOfficialNo();
		
		List<TuitionStuVO> stuList = tuitionService.selectStuView(officicalNo);
		List<FacultyVO> facultyList = facultyService.selectFaculty();
		
		vo.setStuNo(officicalNo);
		
		int cnt = tuitionService.insertTuition(vo);
		System.out.println("등록 결과 cnt="+cnt);
		
		String msg = "등록금 등록에 실패하였습니다.", url="/tuition/tuitionWrite";
		if(cnt > 0) {
			msg = "등록금 등록 성공에 성공하였습니다.";
			url = "/tuition/tuitionList";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	
	/**
	 등록금	
	 *
	 * @param searchVo
	 * @param state
	 * @param model
	 */
	@RequestMapping("/tuitionList")
	public void tuitionList(@ModelAttribute StudentSearchVO studentSearchVo,
			@RequestParam(required = false) String state, Model model, Principal principal) {
		MemberDetails user = (MemberDetails)((Authentication)principal).getPrincipal();
		String officicalNo=user.getOfficialNo();
		
		List<TuitionDetailVO> tlist = tuitionService.selectTuitionDView(officicalNo);
		
		logger.info("tuitionList, param:state={}, {}", state, studentSearchVo);
		
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
		model.addAttribute("tlist", tlist);
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
	

	
	// 등록금 관리 - 상세
	@RequestMapping("/tuitionDetail")
	public String tuitionDetail(@RequestParam(defaultValue = "0") int no, Model model) {
		System.out.println("등록금 상세 파라미터 no="+no);
		
		if(no==0) {
			model.addAttribute("msg", "잘못된 url 입니다.");
			model.addAttribute("url", "/tuition/tuitionList");
			
			return "common/message";
		}
		
		TuitionDetailVO vo=tuitionService.selectByNo(no);
		System.out.println("상세 조회 결과 vo="+vo);
			
		model.addAttribute("vo", vo);
		
		return "tuition/tuitionDetail";
	}
	
	// 등록금 관리 - 수정
	@RequestMapping(value="/tuitionEdit", method=RequestMethod.GET)
	public String tuitionEdit_get(@RequestParam(defaultValue = "0") int no,  Model model) {
		//1
		System.out.println("등록금 수정 파라미터  no=" + no);
		
		if(no==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/tuition/tuitionList");
			
			return "common/message";
		}
		
		TuitionDetailVO vo= tuitionService.selectByNo(no);
		System.out.println("등록금 수정 조회 결과 vo=" + vo);
		
		model.addAttribute("vo", vo);

		return "tuition/tuitionEdit";
	}
	
	@RequestMapping(value="/tuitionEdit", method=RequestMethod.POST)
	public String tuitionEdit_post(@ModelAttribute TuitionDetailVO dVo, Model model) {
		System.out.println("수정 파라미터 dVo=" + dVo);

		String msg="등록금 수정 실패", url="/tuition/tuitionEdit.do?no="+dVo.getNo();
		int cnt=tuitionService.updateTuition(dVo);
		if(cnt>0) {
			msg="등록금 수정 처리되었습니다";
			url="/tuition/tuitionDetail.do?no="+dVo.getNo();
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	

	
	// 등록금 관리 - 삭제 
	@RequestMapping("/delete")
	public String delete(Principal principal, @ModelAttribute TuitionDetailVO dVo, Model model) {
		MemberDetails user = (MemberDetails) ((Authentication)principal).getPrincipal();
		String officicalNo = user.getOfficialNo();
		
		System.out.println("등록금 삭제 파라미터 dVo=" + dVo);
		
		int cnt = tuitionService.deleteTuition(officicalNo);
		System.out.println("등록금 삭제 결과 cnt=" + cnt);
		
		String msg="등록금 삭제 실패", url="/tuition/delete";
		if(cnt>0) {
			msg="등록금 삭제되었습니다.";
			url="/tuition/tuitionlist";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	 
}
