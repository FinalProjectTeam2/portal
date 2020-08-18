package com.will.portal.admin.controller;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
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

import com.will.portal.admin.model.AdminOpenSebjVO;
import com.will.portal.admin.model.AdminService;
import com.will.portal.common.AdminSubjSearchVO;
import com.will.portal.department.model.DepartmentVO;
import com.will.portal.faculty.model.FacultyVO;
import com.will.portal.open_subj.model.Open_subjVO;
import com.will.portal.registration.model.RegistrationService;
import com.will.portal.subj_type.model.Subj_typeVO;
import com.will.portal.subject.model.OpenSubjectListVO;
import com.will.portal.subject.model.SubjectService;

@Controller
@RequestMapping("/admin/lecture")
public class AdminLectureController {
	@Autowired
	private RegistrationService registServ;
	private static final Logger logger
	= LoggerFactory.getLogger(AdminLectureController.class);
	@Autowired
	private AdminService adminServ;
	@Autowired
	private SubjectService subjectService;
	
	
	@RequestMapping(value = "/adminRegisterLecture", method = RequestMethod.GET)
	public void adminRegisterLecture() {
		logger.info("adminRegisterLecture, GET");
	}
	
	@RequestMapping(value = "/adminManageLecture",method = RequestMethod.GET)
	public String adminManageLec(@RequestParam(defaultValue = "0") int facultyNo, Model model) {
		logger.info("adminManageLecture, Get");
		List<FacultyVO> fList = registServ.selectFaculty();
		List<DepartmentVO> dList = registServ.selectDepartment(facultyNo);
		List<Subj_typeVO> sList = adminServ.subjTypeList();
		
		logger.info("학부 list.size={}, 학과 list.size={}", fList.size(), dList.size());
		
		model.addAttribute("sList", sList);
		model.addAttribute("fList", fList);
		model.addAttribute("dList", dList);
		
		return "/admin/lecture/adminManageLecture";
	}

	@RequestMapping(value = "/adminManageLecture",method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> adminManageLec_post(@RequestParam(defaultValue = "0") int facultyNo, Model model) {
		logger.info("수정페이지 파라미터 facultyNo={}", facultyNo);
		List<FacultyVO> fList = registServ.selectFaculty();
		List<DepartmentVO> dList = registServ.selectDepartment(facultyNo);
		List<Subj_typeVO> sList = adminServ.subjTypeList();
		
		logger.info("학부 list.size={}, 학과 dList.size={}", fList.size(), dList.size());
		
		Map<String, Object> map = new HashedMap<String, Object>();
		map.put("fList", fList);
		map.put("dList", dList);
		map.put("sList", sList);
		
		return map;
	}
	
	@RequestMapping(value = "/openSubjList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> openSubjList(@ModelAttribute AdminSubjSearchVO vo, Model model){
		logger.info("AdminSubjSearchVO vo={}",vo);
		List<AdminOpenSebjVO> mList=adminServ.selectOpenSubj(vo);
		int count = mList.size();
		String checkNull = "";
		Map<String, Object> map = new HashedMap<String, Object>();
		if(count>0) {
			checkNull="N";
		}else {
			checkNull="Y";
		}
		
		map.put("mList", mList);
		map.put("count", count);
		map.put("checkNull", checkNull);
		map.put("count", count);
		
		return map;
	}
	
	@RequestMapping(value = "/deleteMultiLecture", method = RequestMethod.POST)
	public String deleteMultiLecture(@ModelAttribute OpenSubjectListVO openSubList
			, Model model) {
		logger.info("과목코드 = {}",openSubList);
		List<Open_subjVO> openSubjList = openSubList.getOpenSubList();
		int cnt = subjectService.updateMultiCloseDate(openSubjList);
		String msg = "선택한 강의 삭제 실패", url="/admin/lecture/adminManageLecture";
		if(cnt > 0) {
			msg = "선택한 강의를 삭제 하였습니다";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
}
