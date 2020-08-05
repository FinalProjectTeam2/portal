package com.will.portal.registration.controller;

import java.util.ArrayList;
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

import com.will.portal.common.PaginationInfo;
import com.will.portal.common.Utility;
import com.will.portal.department.model.DepartmentVO;
import com.will.portal.faculty.model.FacultyVO;
import com.will.portal.registration.model.OpenSubjListVO;
import com.will.portal.registration.model.RegistrationService;

@Controller
public class RegistrationController {
	private static final Logger logger=LoggerFactory.getLogger(RegistrationController.class);
	@Autowired
	private RegistrationService registServ;
	
	
	@RequestMapping(value = "/registration/main", method = RequestMethod.GET)
	public String register_get(@RequestParam(defaultValue = "0") int facultyNo, Model model) {
		logger.info("수강신청 뷰페이지 보여주기 파라미터 facultyNo={}", facultyNo);
		List<FacultyVO> fList = registServ.selectFaculty();
		List<DepartmentVO> dList = registServ.selectDepartment(facultyNo);
		
		logger.info("학부 list.size={}, 학과 list.size={}", fList.size(), dList.size());
		
		model.addAttribute("fList", fList);
		model.addAttribute("dList", dList);
		
		return "registration/main";
		
		
	}

	@RequestMapping(value = "/registration/main", method = RequestMethod.POST)
	@ResponseBody
	public List<DepartmentVO> register_post(@RequestParam(defaultValue = "0") int facultyNo, Model model) {
		logger.info("수강신청 뷰페이지 보여주기 파라미터 facultyNo={}", facultyNo);
		List<FacultyVO> fList = registServ.selectFaculty();
		List<DepartmentVO> dList = registServ.selectDepartment(facultyNo);
		
		logger.info("학부 list.size={}, 학과 list.size={}", fList.size(), dList.size());
		
		model.addAttribute("fList", fList);
		model.addAttribute("dList", dList);
		
		return dList;
		
		
	}
	
	
	@RequestMapping(value = "/registration/openSubjList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> openSubjList(@ModelAttribute RegistrationSearchVO regSearchVo, Model model) {
		logger.info("개설된 강의 읽어가기 파라미터 registrationsearchvo={}", regSearchVo);
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo.setCurrentPage(regSearchVo.getCurrentPage());

		regSearchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		regSearchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		
		List<OpenSubjListVO> list = registServ.openSubjList();
		int count = list.size();
		Map<String, Object> map = new HashedMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		logger.info("리스트 개수 count={}", count);
		
		return map;
		
		
	}
	
	
}
