package com.will.portal.student.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
import com.will.portal.student.model.StudentService;
@Controller
@RequestMapping("/student")
public class StudentController {
	private static final Logger logger = LoggerFactory.getLogger(StudentController.class);
	
	@RequestMapping(value="/gradeCheck", method = RequestMethod.GET) 
	public String gradeCheck_get() {
		logger.info("학생 성적조회");
		return "student/gradeCheck";
	}


	@RequestMapping("/studentScore")
	public void studentScore() {
		logger.info("studentScore, param");
	}
	@RequestMapping("/subjEval")
	public void subjEval() {
		logger.info("강의평가 화면 보여주기");
	}
}
