package com.will.portal.student.controller;

import java.security.Principal;
import java.util.ArrayList;
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

import com.will.portal.common.MemberDetails;
import com.will.portal.common.ScoreSearchVO;
import com.will.portal.student.model.StudentService;

@Controller
@RequestMapping("/student")
public class StudentController {
	private static final Logger logger = LoggerFactory.getLogger(StudentController.class);

	@Autowired
	StudentService studentService;

	@RequestMapping(value = "/gradeCheck", method = RequestMethod.GET)
	public String gradeCheck_get() {
		logger.info("학생 성적조회");
		return "student/gradeCheck";
	}

	/**
	 * 학생 성적 조회
	 * 
	 * @param principal
	 * @param semester
	 * @param model
	 */
	@RequestMapping("/studentScore")
	public void studentScore(Principal principal, @RequestParam(required = false) String semester, Model model) {
		MemberDetails user = (MemberDetails) ((Authentication) principal).getPrincipal();
		String officialNo = user.getOfficialNo();

		logger.info("studentScore, param: semester={}, officialNo={}", semester, officialNo);
		List<String> slist = studentService.selectSemester(officialNo);
		logger.info("slist={}", slist);

		List<List<Map<String, Object>>> tlist = new ArrayList<List<Map<String, Object>>>();
		ScoreSearchVO scoreSearchVo = new ScoreSearchVO();
		scoreSearchVo.setStuNo(officialNo);
		if (semester == null || semester.isEmpty()) {
			for (int i = 0; i < slist.size(); i++) {
				scoreSearchVo.setSemester(slist.get(i));
				List<Map<String, Object>> list = studentService.selectScore(scoreSearchVo);
				tlist.add(list);
			}
		} else {

			scoreSearchVo.setSemester(semester);
			List<Map<String, Object>> list = studentService.selectScore(scoreSearchVo);
			tlist.add(list);
		}
		logger.info("tlist={}", tlist);

		List<String> slist2 = new ArrayList<String>();
		String sort = "";
		for (String sem : slist) {
			if (sem.substring(sem.length() - 1).equals("2")) {
				sort = "/1";
			} else if (sem.substring(sem.length() - 1).equals("8")) {
				sort = "/2";
			}
			slist2.add(sem.substring(0, 4) + sort);
		}
		logger.info("slist2={}", slist2);

		List<String> slistCh = new ArrayList<String>();
		String sortCh = "";
		for (String sem : slist) {
			if (sem.substring(sem.length() - 1).equals("2")) {
				sortCh = "01";
			} else if (sem.substring(sem.length() - 1).equals("8")) {
				sortCh = "02";
			}
			slistCh.add(sem.substring(0, 4) + sortCh);
		}
		logger.info("slistCh={}", slistCh);

		model.addAttribute("slist", slist);
		model.addAttribute("slist2", slist2);
		model.addAttribute("slistCh", slistCh);
		model.addAttribute("tlist", tlist);
	}

	@RequestMapping("/subjEval")
	public void subjEval() {
		logger.info("강의평가 화면 보여주기");
	}
}
