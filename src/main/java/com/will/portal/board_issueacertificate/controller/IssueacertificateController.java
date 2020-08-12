package com.will.portal.board_issueacertificate.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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

import com.will.portal.certification.model.CertificationService;
import com.will.portal.certification.model.CertificationVO;
import com.will.portal.common.MemberDetails;

@Controller
public class IssueacertificateController {
	@Autowired
	private CertificationService certService;
	private static final Logger logger = LoggerFactory.getLogger(IssueacertificateController.class);
	
	@RequestMapping(value="/board_issueacertificate/issueacertificate", method = RequestMethod.GET) 
	public String issueacertificate_get(Principal principal, Model model) {
		MemberDetails user = (MemberDetails)((Authentication)principal).getPrincipal();
		String stuNo = user.getOfficialNo();
		
		List<CertificationVO> list = certService.selectByStuNo(stuNo);
		
		model.addAttribute("list", list);
		
		
		
		return "board_issueacertificate/issueacertificate";
	}
	
	@RequestMapping(value = "/payments/complete", method = RequestMethod.POST)
	@ResponseBody
	public String paymentsComplete(Principal principal, @RequestParam String certCode, 
			@RequestParam(defaultValue = "1") int qty, @RequestParam String certName, Model model) {
		
		MemberDetails user = (MemberDetails)((Authentication)principal).getPrincipal();
		String stuNo = user.getOfficialNo();
		
		logger.info("파라미터 stuNo={}, certName={}", stuNo, certName);
		logger.info("파라미터 qty={}, certCode={}", qty, certCode);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		Date d = new Date();
		String year =sdf.format(d);
		
		int num = certService.getSeq();
		int len = (int)(Math.log10(num)+1);
		String temp = "";
		logger.info("sequence길이 len={}", len);
		
		if(len == 1) {
			temp+="000"+num;
		}else if(len==2) {
			temp+="00"+num;
		}else if(len==3) {
			temp+="0"+num;
		}else {
			temp=num+"";
		}
		
		String no=year+"-"+temp;
		
		CertificationVO vo = new CertificationVO();
		vo.setCertCode(certCode);
		vo.setCertName(certName);
		vo.setNo(no);
		vo.setStuNo(stuNo);
		vo.setQty(qty);
		
		int cnt = certService.insertCert(vo);
		
		String result="결제 실패";
		
		if(cnt > 0) {
			result="결제완료 증명서 현황에서 출력하세요";
		}
		
		List<CertificationVO> list = certService.selectByStuNo(stuNo);
		
		model.addAttribute("list", list);
		
		
		
		return result;
		
	}
}
