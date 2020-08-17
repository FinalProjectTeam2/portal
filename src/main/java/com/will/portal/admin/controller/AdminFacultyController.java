package com.will.portal.admin.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.will.portal.building.model.BuildingService;
import com.will.portal.building.model.BuildingVO;
import com.will.portal.department.model.DepartmentService;
import com.will.portal.department.model.DepartmentVO;
import com.will.portal.faculty.model.FacultyService;
import com.will.portal.faculty.model.FacultyVO;

@Controller
@RequestMapping("/admin/faculty")
public class AdminFacultyController {
	private static final Logger logger
	= LoggerFactory.getLogger(AdminFacultyController.class);

	@Autowired
	private FacultyService facultyService;
	@Autowired
	private BuildingService buildingService;
	@Autowired
	private DepartmentService departmentService;
	
	/**
	 * 학부관리 페이지
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/adminManageFaculty")
	public String adminManageFaculty(Model model) {
		List<FacultyVO> facultyList = facultyService.selectFaculty();
		logger.info("adminManageFaculty,");
		
		List<Map<String, Object>> flist = facultyService.selectFacultyView();
		
		model.addAttribute("flist",flist);
		model.addAttribute("facultyList",facultyList);
		return "admin/faculty/adminManageFaculty";
		
	}
	
	/**
	 * 학부관리 수정팝업 페이지 열기
	 * @param facultyNo
	 * @param depNo
	 * @param model
	 */
	@RequestMapping("/adminEditFaculty")
	public void adminEditFaculty(@RequestParam(defaultValue = "0") int facultyNo,
			@RequestParam(defaultValue = "0") int depNo,Model model) {
		logger.info("adminEditFaculty, popup");
		List<FacultyVO> facultyList = facultyService.selectFaculty();
		
		Map<String,Object> map= facultyService.selectFacultyViewBydepNo(depNo);
		logger.info("selectFacultyViewBydepNo,{}",map);
		
		List<BuildingVO> blist = buildingService.selectAllBuilding();
		
		model.addAttribute("blist",blist);
		model.addAttribute("facultyList",facultyList);
		model.addAttribute("map",map);
	}
	
	/**
	 * 수정팝업 수정하기 완료 ajax
	 * @param departmentVo
	 * @param tel1
	 * @param tel2
	 * @param tel3
	 * @return
	 */
	@RequestMapping("/adminEditFacultyAjax")
	@ResponseBody
	public boolean adminEditFacultyAjax(@ModelAttribute DepartmentVO departmentVo,
			@RequestParam String tel1, @RequestParam String tel2, @RequestParam String tel3) {
		logger.info("adminEditFacultyAjax, {}",departmentVo);
		
		String tel=tel1+"-"+tel2+"-"+tel3;
		departmentVo.setTel(tel);
		
		int cnt=departmentService.updateDepartment(departmentVo);
		boolean result=false;
		if(cnt>0) {
			result=true;
		}
		return result;
	}
	
	/**
	 * 학부이름 수정하기 팝업
	 * @param facultyNo
	 * @param model
	 */
	@RequestMapping("/adminEditFacultyName")
	public void adminEditFacultyName(@RequestParam(defaultValue = "0") int facultyNo,
			Model model) {
		logger.info("adminEditFacultyName, popup");
		FacultyVO facultyVo= facultyService.selectFacultyByFacultyNo(facultyNo);
		
		logger.info("selectFacultyByFacultyNo,{}",facultyVo);
		
		model.addAttribute("facultyVo",facultyVo);
	}
	
	/**
	 * 학부이름 수정하기 완료 ajax
	 * @param facultyVo
	 * @return
	 */
	@RequestMapping("/adminEditFacultyNameAjax")
	@ResponseBody
	public boolean adminEditFacultyNameAjax(@ModelAttribute FacultyVO facultyVo) {
		logger.info("adminEditFacultyNameAjax, {}",facultyVo);

		int cnt=facultyService.updateFacultyName(facultyVo);
		
		boolean result=false;
		if(cnt>0) {
			result=true;
		}
		logger.info("cnt={}, result={}",cnt,result);
		return result;
	}
}
