package com.will.portal.tuition;

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
import com.will.portal.tuition.model.TuitionDetailVO;
import com.will.portal.tuition.model.TuitionService;
import com.will.portal.tuition.model.TuitionStuVO;
import com.will.portal.tuition.model.TuitionViewVO;


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
	public String tuition2(Principal principal,  Model model) {
		MemberDetails user = (MemberDetails) ((Authentication)principal).getPrincipal();
		String officicalNo = user.getOfficialNo();
		
		System.out.println(officicalNo);
		
		System.out.println("목록");
		List<TuitionStuVO> stuList = tuitionService.selectStuView(officicalNo);
		List<TuitionViewVO> tList = tuitionService.selectTuitionView(officicalNo);
		List<TuitionDetailVO> tDList = tuitionService.selectTuitionDView(officicalNo);
		
		for(TuitionStuVO vo: stuList) {
			System.out.println(vo);
		}
		
		System.out.println("목록 확인 결과 stuList="+ stuList.size());
		System.out.println("목록 확인 결과 tList="+ tList.size());
		System.out.println("목록 확인 결과 tDList="+ tDList.size());
		model.addAttribute("stuList", stuList);
		model.addAttribute("tList", tList);
		model.addAttribute("tDList", tDList);

		return "tuition/tuition2";
	}
	
	@RequestMapping("/tuition3") 
	public String tuition3(Principal principal,  Model model) {
		MemberDetails user = (MemberDetails) ((Authentication)principal).getPrincipal();
		String officicalNo = user.getOfficialNo();
		
		System.out.println(officicalNo);
		
		System.out.println("목록");
		List<TuitionStuVO> stuList = tuitionService.selectStuView(officicalNo);
		List<TuitionViewVO> tList = tuitionService.selectTuitionView(officicalNo);
		List<TuitionDetailVO> tDList = tuitionService.selectTuitionDView(officicalNo);
		
		for(TuitionStuVO vo: stuList) {
			System.out.println(vo);
		}
		
		System.out.println("목록 확인 결과 stuList="+ stuList.size());
		System.out.println("목록 확인 결과 tList="+ tList.size());
		System.out.println("목록 확인 결과 tDList="+ tDList.size());
		model.addAttribute("stuList", stuList);
		model.addAttribute("tList", tList);
		model.addAttribute("tDList", tDList);

		return "tuition/tuition3";
	}
	
	@RequestMapping("/tuition5") 
	public String tuition5(Principal principal,  Model model) {
		MemberDetails user = (MemberDetails) ((Authentication)principal).getPrincipal();
		String officicalNo = user.getOfficialNo();
		
		System.out.println(officicalNo);
		
		System.out.println("목록");
		List<TuitionStuVO> stuList = tuitionService.selectStuView(officicalNo);
		List<TuitionViewVO> tList = tuitionService.selectTuitionView(officicalNo);
		List<TuitionDetailVO> tDList = tuitionService.selectTuitionDView(officicalNo);
		
		for(TuitionStuVO vo: stuList) {
			System.out.println(vo);
		}
		
		System.out.println("목록 확인 결과 stuList="+ stuList.size());
		System.out.println("목록 확인 결과 tList="+ tList.size());
		System.out.println("목록 확인 결과 tDList="+ tDList.size());
		model.addAttribute("stuList", stuList);
		model.addAttribute("tList", tList);
		model.addAttribute("tDList", tDList);

		return "tuition/tuition5";
	}
	
	// 등록금 등록 
	@RequestMapping(value = "/tuiton/write", method = RequestMethod.POST)
	public String write_post(Principal principal, @ModelAttribute TuitionDetailVO dVo, Model model) {
		System.out.println("등록금 등록 파라미터 dVo="+ dVo);

		int cnt = tuitionService.insertTuition(dVo);
		System.out.println("등록금 등록 결과 cnt=" + cnt);
		
		String msg="등록 실패", url="/tuition/tuition5";
		if(cnt>0) {
			msg="글 등록되었습니다.";
			url="/tuition/tuitionlist";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	 
	
	// 등록금 수정
	@RequestMapping(value="/tuition/edit.do", method=RequestMethod.GET)
	public String edit_get(@RequestParam(defaultValue = "0") int no,  Model model) {
		//1
		System.out.println("등록금 수정 파라미터  no=" + no);
		
		if(no==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/board/list.do");
			
			return "common/message";
		}
		
		TuitionDetailVO dVo= tuitionService.selectByNo(no);
		System.out.println("등록금 수정 조회 결과 vo=" + dVo);
		
		model.addAttribute("dVo", dVo);

		return "tuition/edit";
	}
	
	@RequestMapping(value="/tuition/edit.do", method=RequestMethod.POST)
	public String edit_post(@ModelAttribute TuitionDetailVO dVo, Model model) {
		System.out.println("수정 파라미터 dVo=" + dVo);

		String msg="등록금 수정 실패", url="/tuition/edit.do?no="+TuitionDetailVO.getNo();
		int cnt=tuitionService.updateTuition(dVo);
		if(cnt>0) {
			msg="등록금 수정 처리되었습니다";
			url="/tuition/detail.do?no="+TuitionDetailVO.getNo();
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	// 등록금 삭제 
	@RequestMapping(value = "/delete")
	public String delete(Principal principal, @ModelAttribute TuitionDetailVO dVo, Model model) {
		MemberDetails user = (MemberDetails) ((Authentication)principal).getPrincipal();
		String officicalNo = user.getOfficialNo();
		
		System.out.println("등록금 삭제 파라미터 dVo=" + dVo);
		
		int cnt = tuitionService.deleteTuition(officicalNo);
		System.out.println("등록금 삭제 결과 cnt=" + cnt);
		
		String msg="등록금 삭제 실패", url="/tuition/tuition5";
		if(cnt>0) {
			msg="등록금 삭제되었습니다.";
			url="/tuition/tuitionlist";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	 
}
