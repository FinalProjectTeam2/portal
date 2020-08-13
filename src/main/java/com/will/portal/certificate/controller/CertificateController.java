package com.will.portal.certificate.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.will.portal.certification.model.CertificationService;
import com.will.portal.certification.model.CertificationVO;
import com.will.portal.student.model.StudentService;


@Controller
@RequestMapping("/certificate")
public class CertificateController {
	private static final Logger logger = LoggerFactory.getLogger(CertificateController.class);

	@Autowired
	private StudentService stuServ;
	
	@Autowired
	private CertificationService certiServ;
	
	@RequestMapping(value="/certificate1",method = RequestMethod.GET) 
	public String certificate1_get(@RequestParam String stuNo, @RequestParam String no, Model model) {
		logger.info("재학증명서 페이지");
		Map<String,Object> map = stuServ.selectViewByStuNo(stuNo);
		CertificationVO vo = certiServ.selectByNo(no);
		model.addAttribute("map", map);
		model.addAttribute("vo", vo);
		return "portal/certificate/certificate1";
	}

	@RequestMapping(value="/certificate2",method = RequestMethod.GET) 
	public String certificate2_get() {
		return "portal/certificate/certificate2";
	}
	
	@RequestMapping(value="/certificate3",method = RequestMethod.GET) 
	public String certificate3_get() {
		return "portal/certificate/certificate3";
	}
	
	@RequestMapping(value="/certificate4",method = RequestMethod.GET) 
	public String certificate4_get() {
		return "portal/certificate/certificate4";
	}
}
