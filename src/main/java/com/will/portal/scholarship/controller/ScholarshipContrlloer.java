package com.will.portal.scholarship.controller;

import java.security.Principal;
import java.util.List;

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

import com.will.portal.common.MemberDetails;
import com.will.portal.common.PaginationInfo;
import com.will.portal.common.SearchVO;
import com.will.portal.common.Utility;
import com.will.portal.scholarship.model.ScholarshipAllVO;
import com.will.portal.scholarship.model.ScholarshipService;
import com.will.portal.tuition.model.TuitionDetailVO;
import com.will.portal.tuition.model.TuitionService;
import com.will.portal.tuition.model.TuitionStuVO;

@Controller
@RequestMapping("/scholarship")
public class ScholarshipContrlloer {
	private static final Logger logger = LoggerFactory.getLogger(ScholarshipContrlloer.class);
	 
	@Autowired ScholarshipService scholarshipService;
	@Autowired TuitionService tuitionService;
	
	/*
	@RequestMapping(value="/scholarship1", method = RequestMethod.GET) 
	public String scholarship1_get() {
		logger.info("장학금 신청");
		return "scholarship/scholarship1";
	}

	
	@RequestMapping(value="/scholarship2", method = RequestMethod.GET) 
	public String scholarship2_get() {
		logger.info("장학금 신청 페이지");
		return "scholarship/scholarship2";
	}
	
	*/
	@RequestMapping(value="/scholarship3", method = RequestMethod.GET) 
	public String scholarship3_get() {
		logger.info("장학금 확인 페이지");
		return "scholarship/scholarship3";
	}


	@RequestMapping("/scholarship1") 
	public String scholarship1(Principal principal,  Model model) {
		MemberDetails user = (MemberDetails) ((Authentication)principal).getPrincipal();
		String officicalNo = user.getOfficialNo(); 
		
		System.out.println(officicalNo);
		System.out.println("장학금 확인 페이지");

		List<ScholarshipAllVO> list = scholarshipService.selectAllScholarship(officicalNo);
		System.out.println("목록 확인 결과 list="+ list.size());
		
		model.addAttribute("list", list);
		

		return "scholarship/scholarship1";
	}
	
	
	@RequestMapping("/scholarship2") 
	public String scholarship2(Principal principal,  Model model, @ModelAttribute SearchVO searchVo) {
		MemberDetails user = (MemberDetails) ((Authentication)principal).getPrincipal();
		String officicalNo = user.getOfficialNo(); 

		System.out.println("장학금 목록 페이지, 파라미터 searchVo=" + searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		
		List<TuitionStuVO> stuList = tuitionService.selectStuView(officicalNo);
		List<ScholarshipAllVO> list = scholarshipService.selectAllScholarship(officicalNo);
		System.out.println("목록 확인 결과 list="+ list.size());
		
		int totalRecord=scholarshipService.selectTotalRecord(searchVo);
		System.out.println("목록 전체 레코드 개수 =" + totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("stuList", stuList);
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
	}
	
	// 장학금 등록 
	@RequestMapping(value = "/scholarship/write", method = RequestMethod.POST)
	public String write_post(Principal principal, @ModelAttribute ScholarshipAllVO vo, Model model) {
		System.out.println("장학금 등록 파라미터 dVo="+ vo);

		int cnt = scholarshipService.insertscholarship(vo);
		System.out.println("장학금 등록 결과 cnt=" + cnt);
		
		String msg="등록 실패", url="/scholarship/scholarship";
		if(cnt>0) {
			msg="글 등록되었습니다.";
			url="/scholarship/scholarship";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
		 
		
	// 장학금 수정
	@RequestMapping(value="/scholarship/edit.do", method=RequestMethod.GET)
	public String edit_get(@RequestParam(defaultValue = "0") int no,  Model model) {
		System.out.println("장학금 수정 파라미터  no=" + no);
		
		if(no==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/scholarship/list.do");
			
			return "common/message";
		}
		
		ScholarshipAllVO vo= scholarshipService.selectByNo(no);
		System.out.println("장학금 수정 조회 결과 vo=" + vo);
		
		model.addAttribute("vo", vo);

		return "scholarship/edit";
	}
	
	@RequestMapping(value="/scholarship/edit.do", method=RequestMethod.POST)
	public String edit_post(@ModelAttribute ScholarshipAllVO vo, Model model) {
		System.out.println("수정 파라미터 vo=" + vo);

		String msg="장학금 수정 실패", url="/scholarship/edit.do?no="+ScholarshipAllVO.getNo();
		int cnt=scholarshipService.updatescholarship(vo);
		if(cnt>0) {
			msg="장학금 수정 처리되었습니다";
			url="/scholarship/detail.do?no="+ScholarshipAllVO.getNo();
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	// 장학금 삭제 
	@RequestMapping(value = "/delete")
	public String delete(Principal principal, @ModelAttribute ScholarshipAllVO vo, Model model) {
		MemberDetails user = (MemberDetails) ((Authentication)principal).getPrincipal();
		String officicalNo = user.getOfficialNo();
		
		System.out.println("장학금 삭제 파라미터 vo=" + vo);
		
		int cnt = tuitionService.deleteTuition(officicalNo);
		System.out.println("장학금 삭제 결과 cnt=" + cnt);
		
		String msg="장학금 삭제 실패", url="/scholarship/scholarship";
		if(cnt>0) {
			msg="장학금 삭제되었습니다.";
			url="/scholarship/scholarship";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}

	
}
