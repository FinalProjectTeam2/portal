package com.will.portal.lecture.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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

import com.will.portal.common.MemberDetails;
import com.will.portal.evaluation.model.EvaluationAllVO;
import com.will.portal.evaluation.model.EvaluationService;
import com.will.portal.professor.model.ProfessorService;
import com.will.portal.regi_timetable.model.Regi_timetableVO;
import com.will.portal.subj_time.model.Subj_timeVO;
import com.will.portal.subject.model.SubjectAllVO;

@Controller
public class LectureController {
	private static final Logger logger = LoggerFactory.getLogger(LectureController.class);
	@Autowired
	private ProfessorService profService;
	@Autowired
	private EvaluationService evaluationServ;
	
	@RequestMapping("/lecture/openLecture_bak")
	public void openLecture_bak() {
		logger.info("교수 과목 등록 페이지");
	}
	
	@RequestMapping("/lecture/openLecture")
	public String openLecture(Principal principal, Model model) {
		MemberDetails user = (MemberDetails)((Authentication)principal).getPrincipal();
		String profNo = user.getOfficialNo();
		logger.info("교수 과목 등록 페이지 파라미터 profNo={}", profNo);
		
		String depNo = profNo.substring(5, 8);
		logger.info("교수 과목 확인 처리 페이지 profNo={}, depNo={}", profNo, depNo);
		
		List<SubjectAllVO> list = profService.loadByProfNo(profNo);
		
		
		List<Map<String, Object>> classList = profService.classroomByDepNo(depNo);
		
		logger.info("list.size={}, classList.size={}", list.size(), classList.size());
		
		
		
		
		
		
		
		
		model.addAttribute("list", list);
		model.addAttribute("cList", classList);
		
		
		return "/lecture/openLecture";
	}
	
	@RequestMapping(value = "/lecture/addSubject", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String addSubject(@RequestParam String subject, @RequestParam String time, 
			@RequestParam String classroom, HttpSession session, Model model) {
		logger.info("입력한 과목 처리 페이지 파라미터 subject={}, time={}", subject, time);
		logger.info("추가 파라미터 classroom={}", classroom);
		//교수번호 session에서 확인
		String profNo = (String)session.getAttribute("officialNo");
		String openSubCode = subject.substring(4);
		String timetableCode = time;
		Subj_timeVO vo = new Subj_timeVO();
		vo.setOpenSubCode(openSubCode);
		vo.setClassroomCode(classroom);
		vo.setTimetableCode(time);
		
		Regi_timetableVO rVo = new Regi_timetableVO();
		rVo.setOpenSubCode(openSubCode);
		rVo.setShortNames(profService.selectShortName(timetableCode));
		
		int codeCount = profService.countByOpenCode(openSubCode);
		logger.info("해당 코드에 등록된 수 codeCount={}", codeCount);
		
		int regiCount = 0;
		
		if(codeCount == 0) {
			//등록이 되지 않았을경우 insert
			regiCount=profService.insertTimetable(rVo);
			logger.info("insert 결과 regiCount={}", regiCount);
		}else {
			//이미 등록된경우 update
			regiCount=profService.updateTimetable(rVo);
			logger.info("update 결과 regiCount={}", regiCount);
		}
		
		
		
		int cnt = profService.insertSubjTime(vo);
		String message="";
		if(cnt>0)	message="해당 시간에 입력되었습니다.";
		logger.info("입력 확인 cnt={}", cnt);
		return message;
	}
	
	
	
	
	@RequestMapping("/lecture/timeByProfNo")
	@ResponseBody
	public List<Subj_timeVO> timeByProfNo(@RequestParam String profNo){
		logger.info("교수 시간표 읽은 후  리턴 페이지 파라미터 profNo={}", profNo);
		
		List<Subj_timeVO> timeList = profService.timeByProfNo(profNo); 
		logger.info("시간표 읽어옴 list.size={}", timeList.size());
		
		return timeList;
	}
	
	
	@RequestMapping("/lecture/updateTable")
	@ResponseBody
	public List<SubjectAllVO> updateTable(Principal principal){
		logger.info("입력 후 테이블 업데이트");
		MemberDetails user = (MemberDetails)((Authentication)principal).getPrincipal();
		String profNo = user.getOfficialNo();
		List<SubjectAllVO> tList = profService.loadByProfNo(profNo);
		return tList;
		
	}
	
	@RequestMapping(value = "/lecture/professorView", method = RequestMethod.GET)
	public String profView(Principal principal, @RequestParam(required = false) String subCode, Model model) {
		MemberDetails user = (MemberDetails)((Authentication)principal).getPrincipal();
		String profNo = user.getOfficialNo();
		//select option에 들어갈 list
		List<Map<String, Object>> sList = evaluationServ.subjectByProfNo(profNo);
		//학생list
		List<EvaluationAllVO> list = evaluationServ.selectAllListforEval(subCode);
		logger.info("학생평가 페이지 list.size()={}, selectList.size={}", list.size(), sList.size());
		model.addAttribute("list", list);
		model.addAttribute("sList", sList);
		
		
		return "lecture/professorView";
	}
	
	
	@RequestMapping(value = "/lecture/evaluation", method = RequestMethod.POST)
	@ResponseBody
	public List<EvaluationAllVO> profView_post(Principal principal, @RequestParam(required = false) String subCode, Model model) {
		MemberDetails user = (MemberDetails)((Authentication)principal).getPrincipal();
		String profNo = user.getOfficialNo();
		//학생list
		
		List<EvaluationAllVO> list = evaluationServ.selectAllListforEval(subCode);
		
		logger.info("학생평가 페이지 list.size()={}, 매개변수 subCode={}", list.size(), subCode);
		
		
		
		return list;
	}
	
	
	
	
	
}
