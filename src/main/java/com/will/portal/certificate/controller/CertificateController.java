package com.will.portal.certificate.controller;

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

import com.will.portal.certification.model.CertificationService;
import com.will.portal.certification.model.CertificationVO;
import com.will.portal.common.MemberDetails;
import com.will.portal.student.model.StudentService;


@Controller
@RequestMapping("/certificate")
public class CertificateController {
	private static final Logger logger = LoggerFactory.getLogger(CertificateController.class);

	@Autowired
	private StudentService stuServ;
	
	@Autowired
	private CertificationService certiServ;
	
	@RequestMapping("/test")
	public String test(@RequestParam String no, Model model) {
		model.addAttribute("no", no);
		return "portal/certificate/test";
	}
	
	@RequestMapping(value="/certificate1",method = RequestMethod.GET) 
	public String certificate1_get(Authentication authentication, @RequestParam String no, Model model) {
		logger.info("재학증명서 페이지");
		MemberDetails user = (MemberDetails)authentication.getPrincipal();
		Map<String,Object> map = stuServ.selectViewByStuNo(user.getOfficialNo());
		CertificationVO vo = certiServ.selectByNo(no);
		int cnt = certiServ.updateIsPrint(no);
		logger.info("프린트 없데이트 결과={}",cnt);
		model.addAttribute("map", map);
		model.addAttribute("vo", vo);
		switch (vo.getCertCode()) {
			case "certEnroll": //재학
				return "portal/certificate/certificate1";
			case "certGradu": //졸업
				return "portal/certificate/certificate2";
			case "certEnroll2": // 재적
				return "portal/certificate/certificate3";
		default: // 장학
			return "portal/certificate/certificate4";
		}
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
	
	@RequestMapping(value="/certificate5",method = RequestMethod.GET) 
	public String certificate5_get() {
		return "portal/certificate/certificate5";

	}
}
