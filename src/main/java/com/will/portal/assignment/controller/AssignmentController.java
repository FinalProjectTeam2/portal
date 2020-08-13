package com.will.portal.assignment.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.will.portal.assignment.model.AssignmentService;
import com.will.portal.assignment.model.Distribute_assignVO;
import com.will.portal.common.MemberDetails;


@Controller
@RequestMapping("/assignment")
public class AssignmentController {
	private static final Logger logger = LoggerFactory.getLogger(AssignmentController.class);
	@Autowired
	private AssignmentService assignServ;
	
	
	@RequestMapping(value="/assignment1",method = RequestMethod.GET) 
	public String assignment1_get() {
		return "assignment/assignment1";
	}
	
	@RequestMapping(value="/assignment2",method = RequestMethod.GET) 
	public String assignment2_get() {
		return "assignment/assignment2";
	}

	@RequestMapping(value="/assignmentStu1",method = RequestMethod.GET) 
	public String assignmentStu1_get() {
		return "assignment/assignmentStu1";
	}
	
	@RequestMapping(value="/assignmentStu2",method = RequestMethod.GET) 
	public String assignmentStu2_get() {
		return "assignment/assignmentStu2";
	}
	
	@RequestMapping(value = "/assignApply")
	public String assignApply(Principal principal, Model model) {
		MemberDetails user = (MemberDetails)((Authentication)principal).getPrincipal();		
		String stuNo = user.getOfficialNo();
		logger.info("과제 등록 페이지 stuNo={}", stuNo);
		
		List<Map<String, Object>> list = assignServ.subjByStuNo(stuNo);
		logger.info("수강신청한 과목 list={}", list.size());
		
		model.addAttribute("list", list);
		
		
		
		return "assignment/assignApply";
	}
	
	@RequestMapping(value = "/getAssignment", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	@ResponseBody
	public List<Distribute_assignVO> getAssign(@RequestParam String openSubCode) {
		logger.info("opensubcode로 입력한 과제 읽어가는 페이지 파라미터 openSubCode={}", openSubCode);
		
		List<Distribute_assignVO> list = assignServ.getDistAssign(openSubCode);
		logger.info("읽어온 입력한과제 list.size={}", list.size());
		
		return list;
		
	}
	
	
	
	
	
	
}
