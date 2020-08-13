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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.will.portal.common.MemberDetails;
import com.will.portal.files.model.FilesService;
import com.will.portal.official_info.model.Official_infoService;
import com.will.portal.official_info.model.Official_infoVO;
import com.will.portal.registration.model.RegistrationVO;
import com.will.portal.student.model.StudentService;
import com.will.portal.subj_eval.model.Subj_evalService;
import com.will.portal.subj_eval.model.Subj_evalVO;
import com.will.portal.common.ScoreSearchVO;
import com.will.portal.student.model.StudentService;

@Controller
@RequestMapping("/student")
public class StudentController {
	private static final Logger logger = LoggerFactory.getLogger(StudentController.class);
	@Autowired private Subj_evalService subjService;
	
	@Autowired
	StudentService studentService;

	@RequestMapping(value = "/gradeCheck", method = RequestMethod.GET)
	public String gradeCheck_get() {
		logger.info("학생 성적조회");
		return "student/gradeCheck";
	}


	/**
	 * 학생 성적 조회
	 * @param principal
	 * @param semester
	 * @param model
	 */

	@RequestMapping("/studentScore")
	public void studentScore(Principal principal, @RequestParam(required = false) String semester, Model model) {
		MemberDetails user = (MemberDetails) ((Authentication)principal).getPrincipal();
	    String officialNo = user.getOfficialNo();
		
		logger.info("studentScore, param: semester={}, officialNo={}",semester,officialNo);
		List<String> slist = studentService.selectSemester(officialNo);
		logger.info("slist={}", slist);
		
		ScoreSearchVO scoreSearchVo=new ScoreSearchVO();
		scoreSearchVo.setStuNo(officialNo);
		scoreSearchVo.setSemester(semester);
		List<Map<String, Object>> list = studentService.selectScore(scoreSearchVo);
		logger.info("list={}", list);

		List<String> slist2 = new ArrayList<String>();
		String sort = "";
		for (String sem : slist) {
			if (sem.substring(sem.length() - 1).equals("2")) {
				sort = "/1학기";
			} else if (sem.substring(sem.length() - 1).equals("8")) {
				sort = "/2학기";
			}
			slist2.add(sem.substring(0, 4) + sort);
		}
		logger.info("slist2={}", slist2);

		model.addAttribute("slist",slist);
		model.addAttribute("slist2", slist2);
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value = "/subjEval", method = RequestMethod.GET)
	public String subjEval(@RequestParam String subjCode, Model model) {
		logger.info("강의평가 화면 보여주기");
		Map<String, Object> map = subjService.selectProfNameBySubj(subjCode);
		model.addAttribute("map", map);
		return "/student/subjEval";
	}
	
	@RequestMapping(value = "/subjEval", method = RequestMethod.POST)
	public String subjEval_post(@ModelAttribute Subj_evalVO vo, Principal principal,
			@RequestParam String subjCode,
			Model model) {
		logger.info("강의평가 submit evalVo={}", vo);
		//MRC-111-101
		MemberDetails user = (MemberDetails) ((Authentication)principal).getPrincipal();
	    String stuNo = user.getOfficialNo();
	    String classification = subjCode.substring(0,3);
	    String subCode = subjCode.substring(4);
	    vo.setSubCode(subCode);
	    vo.setClassification(classification);
	    vo.setStuNo(stuNo);
	    
	    int cnt = subjService.insertSubjEval(vo);
	    
	    RegistrationVO regiVo = new RegistrationVO();
	    regiVo.setStuNo(stuNo);
	    regiVo.setSubCode(subCode);
	    String msg = "강의평가 등록에 실패하였습니다", url = "/student/subjEval";
	    if(cnt > 0) {
	    	cnt = subjService.updateEvalFlag(regiVo);
	    	msg = "강의평가 등록을 완료하였습니다";
	    	url = "/lecture/studentTT";
	    }
	    
	    logger.info("강의평가 결과 cnt={}",cnt);
	    
	    model.addAttribute("msg", msg);
	    model.addAttribute("url", url);
	    
	    return "/common/message";
	}

	
}
