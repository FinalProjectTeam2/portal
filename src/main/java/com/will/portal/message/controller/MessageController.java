package com.will.portal.message.controller;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.will.portal.common.MemberDetails;
import com.will.portal.common.PaginationInfo;
import com.will.portal.common.Utility;
import com.will.portal.employee.model.EmployService;
import com.will.portal.employee.model.EmployeeVO;
import com.will.portal.message.model.InboxVO;
import com.will.portal.message.model.MessageAllVO;
import com.will.portal.message.model.MessageSearchVO;
import com.will.portal.message.model.MessageService;
import com.will.portal.message.model.OutboxVO;
import com.will.portal.professor.model.ProfessorService;
import com.will.portal.professor.model.ProfessorVO;
import com.will.portal.student.model.StudentService;
import com.will.portal.student.model.StudentVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/message")
public class MessageController {
	
	@Autowired
	MessageService service;
	@Autowired
	EmployService empServ;
	@Autowired
	ProfessorService profServ;
	@Autowired
	StudentService stuServ;
	
	@GetMapping("/messageBox")
	public void messageBox(@RequestParam(defaultValue = "in") String type, Model model) {
		log.info("쪽지함 보여주기");
		model.addAttribute("type", type);
	}
	
	@GetMapping("/sendMessage")
	public void sendMessage(@RequestParam(defaultValue = "send") String type, 
			@RequestParam(required = false) String officialNo,
			Authentication authentication,	Model model) {
		log.info("쪽지 보내기 화면 보여주기, 파라미터 type={}",type);
		MemberDetails user = (MemberDetails) authentication.getPrincipal();
		model.addAttribute("type", type);
		model.addAttribute("user", user);
		model.addAttribute("officialNo", officialNo);
	}
	
	@RequestMapping("/ajax/insert")
	@ResponseBody
	public String insertMsg(Authentication authentication, @RequestParam String officialNo,
			@RequestParam String writeNote) {
		log.info("ajax 0 insertMsg writeNote={}",writeNote);
		MemberDetails user = (MemberDetails) authentication.getPrincipal();
		OutboxVO outVo = new OutboxVO();
    	outVo.setContents(writeNote);
    	outVo.setOfficialNo(user.getOfficialNo());
    	outVo.setOfficialName(user.getName());
    	log.info("outVo={}",outVo);
    	int cnt = service.insertOutbox(outVo);
    	log.info("outbox insert 결과 cnt={}",cnt);
    	
    	boolean bool = false;
    	
    	if(officialNo.indexOf(',') != -1) {
    		String[] offiSplit = officialNo.split(",");
    		log.info("offiLeng={}",offiSplit.length);
    		for (String offiNo : offiSplit) {
    			InboxVO inVo = new InboxVO();
    	    	inVo.setMsgNo(outVo.getMsgNo());
    	    	inVo.setOfficialNo(offiNo.trim());
    	    	log.info("inVo={}",inVo);
    	    	cnt = service.insertInbox(inVo);
    	    	log.info("inbox insert 결과 cnt={}",cnt);
			}
    		
    		bool = true;
    	}else {
    		InboxVO inVo = new InboxVO();
	    	inVo.setMsgNo(outVo.getMsgNo());
	    	inVo.setOfficialNo(officialNo.trim());
	    	cnt = service.insertInbox(inVo);
	    	log.info("inbox insert 결과 cnt={}",cnt);
	    	
	    	bool = true;
    	}
		return bool +"";
	}
	
	@RequestMapping("/ajax/list")
	@ResponseBody
	public Map<String, Object> msgList(Authentication authentication, @ModelAttribute MessageSearchVO vo,
			@RequestParam(defaultValue = "in") String type) {
		MemberDetails user = (MemberDetails) authentication.getPrincipal();
		vo.setOfficialNo(user.getOfficialNo());
		vo.setBlockSize(Utility.BLOCKSIZE);
		vo.setRecordCountPerPage(Utility.RECORD_COUNT);
		
		log.info("ajax - msgList, 파라미터 type={}, user={}",type,user);
		log.info("ajax - msgList, vo={}",vo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(vo.getRecordCountPerPage());
		pagingInfo.setCurrentPage(vo.getCurrentPage());
		
		vo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<MessageAllVO> list = null;
		int totalCount = 0;
		switch (type) {
		case "in":
			list = service.selectInMsgByOfficialNo(vo);
			totalCount = service.selectInMsgCount(vo);
			break;
		case "out":
			if(vo.getSearchCondition().equals("o.official_no")) {
				vo.setSearchCondition("i.official_no");
			}
			list = service.selectOutMsgByOfficialNo(vo);
			totalCount = service.selectOutMsgCount(vo);
			if(vo.getSearchCondition().equals("i.official_no")) {
				vo.setSearchCondition("o.official_no");
			}
			break;
		case "self":
			list = service.selectSelfMsgByOfficialNo(vo);
			totalCount = service.selectSelfMsgCount(vo);
			break;
		case "save":
			list = service.selectKeepMsgByOfficialNo(vo);
			totalCount = service.selectKeepMsgCount(vo);
			break;
		default:
			list = service.selectAllMsgByOfficialNo(vo);
			totalCount = service.selectAllMsgCount(vo);
			break;
		}
		
		pagingInfo.setTotalRecord(totalCount);
		log.info("쪽지 함 검색 결과 list.size={}",list.size());
		log.info("쪽지 함 검색 결과 totalCount={}",totalCount);
		
		if (pagingInfo.getTotalPage() < pagingInfo.getCurrentPage()) {
			pagingInfo.setCurrentPage(pagingInfo.getTotalPage());
		}
		
		Map<String, Object> map = new HashedMap<String, Object>();
		map.put("list", list);
		map.put("vo", vo);
		map.put("pagingInfo", pagingInfo);
		
		return map;
	}
	
	@RequestMapping("/messageDetail")
	public void messageDetail(@RequestParam int no, Model model, Authentication authentication) {
		log.info("쪽지 상세보기페이지, 파라미터 no={}",no);
		MessageAllVO vo = service.selectByNo(no);
		log.info("상세보기 조회 결과 vo={}",vo);
		MemberDetails user = (MemberDetails) authentication.getPrincipal();
		if(vo.getInOffi().equals(user.getOfficialNo())) {
			int cnt = service.updateReadDateByNo(no);
			log.info("읽은 날짜 업데이트 cnt={}",cnt);
		}
		model.addAttribute("vo", vo);
	}
	
	@PostMapping("/messageDeleteNo")
	@ResponseBody
	public String messageDeleteNo( @RequestParam(value = "chbox[]") List<String> chArr) {
		log.info("ajax - messageDeleteNo, 파라미터 chArr={}",chArr.toString());
		int cnt = 0;
		for (String no : chArr) {
			cnt += service.deleteInboxByNo(Integer.parseInt(no));
		}
		log.info("쪽지 삭제 결과, cnt={}",cnt);
		return cnt+"";
	}
	@PostMapping("/messageKeep")
	@ResponseBody
	public String messageKeep( @RequestParam(value = "chbox[]") List<String> chArr) {
		log.info("ajax - messageKeep, 파라미터 chArr={}",chArr.toString());
		int cnt = 0;
		for (String no : chArr) {
			cnt += service.updateKeepMsg(Integer.parseInt(no));
		}
		log.info("쪽지 보관 결과, cnt={}",cnt);
		return cnt+"";
	}
	
	@RequestMapping("/addrList")
	public void addrList() {
		log.info("주소록 검색");
	}
	
	@RequestMapping("/empList")
	@ResponseBody
	public List<EmployeeVO> empList(@RequestParam(required = false) String name) {
		if(name == null) {
			name = "";
		}
		log.info("임직원 주소록 파라미터 name={}",name);
		
		List<EmployeeVO> list = empServ.selectListByName(name);
		return list;
	}
	@RequestMapping("/profList")
	@ResponseBody
	public List<ProfessorVO> profList(@RequestParam(required = false) String name) {
		if(name == null) {
			name = "";
		}
		log.info("교수 주소록 파라미터 name={}",name);
		
		List<ProfessorVO> list = profServ.selectListByName(name);
		return list;
	}
	@RequestMapping("/stuList")
	@ResponseBody
	public List<StudentVO> stuList(@RequestParam(required = false) String name) {
		if(name == null) {
			name = "";
		}
		log.info("학생 주소록 파라미터 name={}",name);
		
		List<StudentVO> list = stuServ.selectListByName(name);
		return list;
	}
}
