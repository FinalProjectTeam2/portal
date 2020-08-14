package com.will.portal.tuition;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.w3c.dom.ls.LSInput;

import com.will.portal.account_info.model.Account_InfoService;
import com.will.portal.account_info.model.Account_infoVO;
import com.will.portal.award.model.AwardService;
import com.will.portal.award.model.AwardVO;
import com.will.portal.bank.model.BankService;
import com.will.portal.bank.model.BankVO;
import com.will.portal.common.MemberDetails;
import com.will.portal.department.model.DepartmentService;
import com.will.portal.department.model.DepartmentVO;
import com.will.portal.faculty.model.FacultyService;
import com.will.portal.faculty.model.FacultyVO;
import com.will.portal.scholarship.model.ScholarshipService;
import com.will.portal.scholarship.model.ScholarshipVO;
import com.will.portal.student.model.StudentService;
import com.will.portal.student.model.StudentVO;
import com.will.portal.tuition.model.TuitionService;
import com.will.portal.tuition.model.TuitionStuVO;
import com.will.portal.tuition.model.TuitionVO;


@Controller
@RequestMapping("/tuition")
public class TuitionController {
	private static final Logger logger = LoggerFactory.getLogger(TuitionController.class);
	
	@Autowired TuitionService tuitionService;
	@Autowired StudentService stuService;
	@Autowired FacultyService facultyService;
	@Autowired DepartmentService departService;
	@Autowired Account_InfoService accountService;
	@Autowired BankService bankService;
	@Autowired AwardService awardService;
	@Autowired ScholarshipService scholarshipService;
	
	@RequestMapping(value="/tuition1", method = RequestMethod.GET) 
	public String tuition1_get() {
		logger.info("납부 안내");
		return "tuition/tuition1";
	}
	

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
	public Map<String, Object> tuition2(Principal principal,  Model model) {
		MemberDetails user = (MemberDetails) ((Authentication)principal).getPrincipal();
		String officicalNo = user.getOfficialNo();
		
		Map<String, Object> map = new HashedMap<>();
		
		Map<String, Object> tuituionStu= tuitionService.selectStuView(officicalNo);
		List<StudentVO> stuList = stuService.selectStudent();
		List<FacultyVO> fList = facultyService.selectFaculty();
		List<DepartmentVO> dList = departService.selectDepartment();
		List<Account_infoVO> aList = accountService.selectAllAccount();
		List<BankVO> bList = bankService.selectAllBank();
		List<AwardVO> awardList = awardService.selectAllaward();
		List<ScholarshipVO> scholarshipList = scholarshipService.selectAllScholarship();
		
		model.addAttribute("tuitionStu", tuituionStu);
		model.addAttribute("stuList", stuList);
		model.addAttribute("fList", fList);
		model.addAttribute("dList", dList);
		model.addAttribute("aList", aList);
		model.addAttribute("bList", bList);
		model.addAttribute("awardList", awardList);
		
		return map;
	}

}
