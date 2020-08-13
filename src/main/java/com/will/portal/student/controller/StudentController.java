package com.will.portal.student.controller;

import java.security.Principal;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.will.portal.SearchController;
import com.will.portal.account_info.model.Account_infoVO;
import com.will.portal.bank.model.BankService;
import com.will.portal.bank.model.BankVO;
import com.will.portal.common.FileUploadUtil;
import com.will.portal.common.MemberDetails;
import com.will.portal.files.model.FilesService;
import com.will.portal.official_info.model.Official_infoService;
import com.will.portal.official_info.model.Official_infoVO;
import com.will.portal.registration.model.RegistrationVO;
import com.will.portal.student.model.StudentService;
import com.will.portal.subj_eval.model.Subj_evalService;
import com.will.portal.subj_eval.model.Subj_evalVO;
@Controller
@RequestMapping("/student")
public class StudentController {
	private static final Logger logger = LoggerFactory.getLogger(StudentController.class);
	@Autowired private Subj_evalService subjService;
	
	@RequestMapping(value="/gradeCheck", method = RequestMethod.GET) 
	public String gradeCheck_get() {
		logger.info("학생 성적조회");
		return "student/gradeCheck";
	}

	@RequestMapping("/studentScore")
	public void studentScore() {
		logger.info("studentScore, param");
	}
	
	@RequestMapping(value = "/subjEval", method = RequestMethod.GET)
	public void subjEval_get() {
		logger.info("강의평가 화면 보여주기");
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
