package com.will.portal.tuition;

import java.security.Principal;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.will.portal.board.controller.BoardController;
import com.will.portal.common.MemberDetails;
import com.will.portal.tuition.model.TuitionService;
import com.will.portal.tuition.model.TuitionStuVO;

@Controller
@RequestMapping("/tuition")
public class TuitionController {
	private static final Logger logger = LoggerFactory.getLogger(TuitionController.class);
	
	@Autowired TuitionService tuitionService;
	 
	@RequestMapping(value="/tuition1", method = RequestMethod.GET) 
	public String tuition1_get() {
		logger.info("납부 안내");
		return "tuition/tuition1";
	}
	

//	@RequestMapping(value="/tuition2", method = RequestMethod.GET) 
//	public String tuition2_get() {
//		logger.info("등록금 조회");
//		return "tuition/tuition2";
//	}
	
	
	@RequestMapping(value="/tuition3", method = RequestMethod.GET) 
	public String tuition3_get() {
		logger.info("등록금 상세조회");
		return "tuition/tuition3";
	}
	
	@RequestMapping(value="/tuition4", method = RequestMethod.GET) 
	public String tuition4_get() {
		logger.info("등록금 영수증 확인");
		return "tuition/tuition4";
	}
	
	@RequestMapping(value="/tuition5", method = RequestMethod.GET) 
	public String tuition5_get() {
		logger.info("등록금 관리");
		return "tuition/tuition5";
	}
	
	@RequestMapping("/tuition2") 
	public void tuition2(Principal principal,  Model model) {
		MemberDetails user = (MemberDetails) ((Authentication)principal).getPrincipal();
		String officialNo = user.getOfficialNo();
		
		List<TuitionStuVO> list= tuitionService.selectStu(officialNo);
		model.addAttribute("list", list);
		
	}

}
