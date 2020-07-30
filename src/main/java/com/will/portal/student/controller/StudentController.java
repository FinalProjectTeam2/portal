package com.will.portal.student.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.will.portal.SearchController;
import com.will.portal.account_info.model.Account_infoVO;
import com.will.portal.bank.model.BankService;
import com.will.portal.bank.model.BankVO;
import com.will.portal.common.MemberDetails;
import com.will.portal.official_info.model.Official_infoService;
import com.will.portal.official_info.model.Official_infoVO;
import com.will.portal.student.model.StudentService;
import com.will.portal.student.model.StudentVO;
@Controller
@RequestMapping("/student")
public class StudentController {
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	@Autowired private StudentService studentService;
	@Autowired private BankService bankService;
	@Autowired private Official_infoService offiService;
	/*
	 * @RequestParam String bankCode, @RequestParam String
	 * accountName, @RequestParam String accountNo,
	 * 
	 * @RequestParam String hp, @RequestParam String email, @RequestParam String
	 * zipcode,
	 * 
	 * @RequestParam String address, @RequestParam String addrDetail
	 */
	
	@RequestMapping(value = "/studentEdit" , method = RequestMethod.GET)
	public String edit_get(Principal principal, Model model) {
		logger.info("학생 수정화면 페이지 보여주기");
		MemberDetails user = (MemberDetails) ((Authentication)principal).getPrincipal();
		String officialNo = user.getOfficialNo();
		
		Map<String, Object> map = studentService.selectViewByStuNo(officialNo);
		List<BankVO> bankList = bankService.selectAllBank();
		model.addAttribute("map", map);
		model.addAttribute("bankList", bankList);
		
		return "/student/studentEdit";
	}
	
	
	 @RequestMapping(value = "/studentEdit" , method = RequestMethod.POST)
	 @ResponseBody
	 public String edit_post(Principal principal, Model model, 
			 @ModelAttribute Account_infoVO accInfoVo,
			 @ModelAttribute Official_infoVO offiVo,
			 @RequestParam String hp,
			 @RequestParam String email) {
		MemberDetails user = (MemberDetails) ((Authentication)principal).getPrincipal();
		String officialNo = user.getOfficialNo();
		accInfoVo.setOfficialNo(officialNo);
		bankService.updateAccount(accInfoVo);
		offiVo.setOfficialNo(officialNo);
		
		offiService.updateOfficialInfo(offiVo);
		
		return null;
	 }
	 

	
	
	
}
