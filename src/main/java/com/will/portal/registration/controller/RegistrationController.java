package com.will.portal.registration.controller;

import java.io.File;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections4.map.HashedMap;
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
import org.springframework.web.servlet.ModelAndView;

import com.will.portal.common.FileUploadUtil;
import com.will.portal.common.MemberDetails;
import com.will.portal.common.PaginationInfo;
import com.will.portal.common.RegistrationSearchVO;
import com.will.portal.common.Utility;
import com.will.portal.department.model.DepartmentVO;
import com.will.portal.faculty.model.FacultyVO;
import com.will.portal.registration.model.OpenSubjListVO;
import com.will.portal.registration.model.RegistrationService;

@Controller
public class RegistrationController {
	private static final Logger logger=LoggerFactory.getLogger(RegistrationController.class);
	@Autowired
	private RegistrationService registServ;
	@Autowired 
	private FileUploadUtil fileUploadUtil;
	
	@RequestMapping(value = "/registration/main", method = RequestMethod.GET)
	public String register_get(@RequestParam(defaultValue = "0") int facultyNo, Model model) {
		logger.info("수강신청 뷰페이지 보여주기 파라미터 facultyNo={}", facultyNo);
		List<FacultyVO> fList = registServ.selectFaculty();
		List<DepartmentVO> dList = registServ.selectDepartment(facultyNo);
		
		logger.info("학부 list.size={}, 학과 list.size={}", fList.size(), dList.size());
		
		model.addAttribute("fList", fList);
		model.addAttribute("dList", dList);
		
		return "registration/main";
		
		
	}

	@RequestMapping(value = "/registration/main", method = RequestMethod.POST)
	@ResponseBody
	public List<DepartmentVO> register_post(@RequestParam(defaultValue = "0") int facultyNo, Model model) {
		logger.info("수강신청 뷰페이지 보여주기 파라미터 facultyNo={}", facultyNo);
		List<FacultyVO> fList = registServ.selectFaculty();
		List<DepartmentVO> dList = registServ.selectDepartment(facultyNo);
		
		logger.info("학부 list.size={}, 학과 list.size={}", fList.size(), dList.size());
		
		model.addAttribute("fList", fList);
		model.addAttribute("dList", dList);
		
		return dList;
		
		
	}
	
	
	@RequestMapping(value = "/registration/openSubjList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> openSubjList(@ModelAttribute RegistrationSearchVO regSearchVo, Model model) {
		
		if(!regSearchVo.getTime1().equals("all") && !regSearchVo.getTime2().equals("all")) {
			regSearchVo.setTime(regSearchVo.getTime1()+regSearchVo.getTime2());
		}
		
		logger.info("개설된 강의 읽어가기 파라미터 registrationsearchvo={}", regSearchVo);
		PaginationInfo pagingInfo = new PaginationInfo();
		
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo.setCurrentPage(regSearchVo.getCurrentPage());

		regSearchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		regSearchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		String checkNull = "";
		List<OpenSubjListVO> list = registServ.openSubjList(regSearchVo);
		//학점과 등록된 시간표의 시간 개수가 일치하지 않으면 삭제한다.
//		if(list!=null && !list.isEmpty()) {
//			for(int i = 0; i < list.size(); i++) {
//				OpenSubjListVO vo = list.get(i);
//				String[] sArr = vo.getShortNames().split(",");
//				if(vo.getCredit() != sArr.length) {
//					list.remove(i);
//				}
//				
//			}
//		}
		int count = list.size();
		logger.info("리스트 개수 count={}", count);
		int totalCount = registServ.openSubjCount(regSearchVo);
		pagingInfo.setTotalRecord(totalCount);
		if(count < 1) {
			checkNull="Y";
		}else {
			checkNull="N";
					
		}
		logger.info("checkNull={}", checkNull);
		Map<String, Object> map = new HashedMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("checkNull", checkNull);
		map.put("pagingInfo", pagingInfo);
		return map;
		
	}
	
	@RequestMapping(value = "/registration/registList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> registerList(Principal principal, Model model){
		logger.info("신청한 수강과목 목록 select");
		
		MemberDetails user = (MemberDetails) ((Authentication)principal).getPrincipal();
		String stuNo = user.getOfficialNo();
		
		String checkNull = "";
		
		//로그인 한 학생 아이디로 수강했던 과목 검색
		List<String> list=registServ.selectRegisted(stuNo); 
		logger.info("파라미터 list.size={}", list.size());
		Map<String, Object> map = new HashedMap<String, Object>();
		List<OpenSubjListVO> subList=null;
		int appliedCount=0;
		if(list.size() < 1) {
			checkNull="Y";
		}else {
			subList = registServ.registedList(list);
			logger.info("학번={}, 수강신청과목수 subList.size={}", stuNo, subList);
			appliedCount = subList.size();
			checkNull="N";
		}
		map.put("subList", subList);
		map.put("appliedCount", appliedCount);
		map.put("checkNull", checkNull);
		
		return map;
		
		
	}
	
	@RequestMapping(value = "/registration/checkDupTime", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String checkDupTime(Principal principal,@RequestParam String shortName) {
		MemberDetails user = (MemberDetails)((Authentication)principal).getPrincipal();
		String stuNo=user.getOfficialNo();
		logger.info("수강신청 시 겹치는 시간이 있는지 체크 처리 shortName={}, stuNo={}", shortName, stuNo);
		String isDup="";
		String[]timeArr=shortName.split(",");
		String shortTimeNames = "";
		List<String> codeList = registServ.codeListByStuNo(stuNo);
		if(codeList.size() < 1) {
			return "N";
		}else {
			for(int i=0; i< codeList.size(); i++) {
				String openSubCode = codeList.get(i);
				shortTimeNames +=  registServ.shortNameByCode(openSubCode)+",";
			}
		}
		for(int i = 0; i< timeArr.length; i++) {
			int result = shortTimeNames.indexOf(timeArr[i]);
			if(result != -1) {
				return "Y";
			}else {
				isDup="N";
			}
		}
		
		return isDup;
	}
	
	
	
	
	
	
	@RequestMapping(value = "/registration/insertReg", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String insertReg(Principal principal, @RequestParam String type, 
			@RequestParam String openSubCode, Model model) {
		logger.info("수강신청 입력 처리");
		MemberDetails user = (MemberDetails)((Authentication)principal).getPrincipal();
		String stuNo=user.getOfficialNo();
		
		Map<String, Object> map = new HashedMap<String, Object>();
		map.put("openSubCode", openSubCode);
		map.put("stuNo", stuNo);
		logger.info("map에 넣은 파라미터 openSubCode={}, stuNo={}", openSubCode, stuNo);
		//해당 학생이 같은 수업 등록한 적이 있는지 확인
		int dup = registServ.countForDup(map);
		logger.info("수강한적이 있는지 dup={}", dup);
		int cnt = 0;
		String result="";
		if(dup == 0) {
			map.put("type", type);
			logger.info("map에 넣은 파라미터 type={}", type);
			cnt = registServ.insertReg(map);
			
			if(cnt > 0) {
				result = "수강신청 등록완료.";
			}else {
				result="수강신청 등록실패";
			}
			
		}else if(dup > 0){
			result="이미 수강신청한 과목입니다.";
		}
		
		return result;

		
		
		
	}
	
	@RequestMapping(value = "/registration/deleteReg", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String deleteReg(Principal principal, @RequestParam String openSubCode, Model model) {
		
		String result = "";
		
		MemberDetails user = (MemberDetails)((Authentication)principal).getPrincipal();
		String stuNo=user.getOfficialNo();
		logger.info("수강신청된 과목 취소처리 파라미터stuNo={}, openSubCode={}", stuNo, openSubCode);
		
		Map<String, Object> map = new HashedMap<String, Object>();
		map.put("stuNo", stuNo);
		map.put("openSubCode", openSubCode);
		
		int cnt=registServ.deleteReg(map);
		if(cnt>0) {
			result="해당과목 수강신청 취소완료.";
		}else {
			result="취소실패 다시 시도해주세요.";
		}
		
		
		
		
		return result;
	}
	
	@RequestMapping("/registration/download")
	public ModelAndView download(@RequestParam String originalFileName,	@RequestParam String fileName, HttpServletRequest request, Model model) {
		// 1.
		logger.info("다운로드 파라미터 originalFileName={}, fileName={}", originalFileName, fileName);
		// 2.

		// 다운로드 처리를 위한 페이지로 넘겨준다
		String upPath = fileUploadUtil.getUploadPath(request, FileUploadUtil.PATH_PDF);
		File file = new File(upPath, fileName);

		// 3.

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("file", file);

		// 4.
		// model에 map 넣기
		ModelAndView mav = new ModelAndView("reBoardDownloadView", map);
		return mav;
	}
	
	
}
