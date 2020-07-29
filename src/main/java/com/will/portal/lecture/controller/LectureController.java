package com.will.portal.lecture.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.will.portal.professor.model.ProfessorService;
import com.will.portal.subject.model.SubjectVO;

@Controller
public class LectureController {
	private static final Logger logger = LoggerFactory.getLogger(LectureController.class);
	@Autowired
	private ProfessorService profService;
	
	@RequestMapping("/lecture/openLecture_bak")
	public void openLecture_bak() {
		logger.info("교수 과목 등록 페이지");
	}
	
	@RequestMapping("/lecture/openLecture")
	public void openLecture() {
		logger.info("교수 과목 등록 페이지");
		
	}
	
	@RequestMapping(value = "/lecture/addSubject", method = RequestMethod.POST)
	public void addSubject(@RequestParam String subject, @RequestParam String time, 
			@RequestParam(defaultValue = "0") int credit, HttpSession session, Model model) {
		logger.info("입력한 과목 처리 페이지");
		
	}
	
	@RequestMapping("/lecture/loadByProfNo")
	public String loadByProfNo(@RequestParam String profNo, Model model) {
		logger.info("교수 과목 확인 처리 페이지");
		
		List<SubjectVO> list = profService.loadByProfNo(profNo);
		logger.info("list.size={}", list.size());
		model.addAttribute("list", list);
		
		return "lecture/openLecture";
		
		
	}
	
}
