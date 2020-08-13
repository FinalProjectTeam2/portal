package com.will.portal.assignment.controller;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.will.portal.assignment.model.AssignmentService;
import com.will.portal.assignment.model.AssignmentVO;
import com.will.portal.assignment.model.Distribute_assignVO;
import com.will.portal.common.FileUploadUtil;
import com.will.portal.common.MemberDetails;
import com.will.portal.evaluation.model.EvaluationAllVO;
import com.will.portal.evaluation.model.EvaluationService;
import com.will.portal.files.model.FilesService;


@Controller
@RequestMapping("/assignment")
public class AssignmentController {
	private static final Logger logger = LoggerFactory.getLogger(AssignmentController.class);
	@Autowired
	private AssignmentService assignServ;
	@Autowired 
	private FileUploadUtil fileUploadUtil;
	@Autowired 
	private FilesService filesService;
	@Autowired
	private EvaluationService evaluationServ;
	
	
	@RequestMapping(value="/assignment1",method = RequestMethod.GET) 
	public String assignment1_get() {
		return "assignment/assignment1";
	}
	
	@RequestMapping(value="/assignment2",method = RequestMethod.GET) 
	public String assignment2_get() {
		return "assignment/assignment2";
	}

	@RequestMapping(value="/assignmentStu1",method = RequestMethod.GET) 
	public String assignmentStu1_get() {
		return "assignment/assignmentStu1";
	}
	
	@RequestMapping(value="/assignmentStu2",method = RequestMethod.GET) 
	public String assignmentStu2_get() {
		return "assignment/assignmentStu2";
	}
	
	@RequestMapping(value = "/assignApply")
	public String assignApply(Principal principal, Model model) {
		MemberDetails user = (MemberDetails)((Authentication)principal).getPrincipal();		
		String stuNo = user.getOfficialNo();
		logger.info("과제 등록 페이지 stuNo={}", stuNo);
		
		List<Map<String, Object>> list = assignServ.subjByStuNo(stuNo);
		logger.info("수강신청한 과목 list={}", list.size());
		
		model.addAttribute("list", list);
		
		
		
		return "assignment/assignApply";
	}
	
	@RequestMapping(value = "/getAssignment", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	@ResponseBody
	public List<Distribute_assignVO> getAssign(@RequestParam String openSubCode) {
		logger.info("opensubcode로 입력한 과제 읽어가는 페이지 파라미터 openSubCode={}", openSubCode);
		
		List<Distribute_assignVO> list = assignServ.getDistAssign(openSubCode);
		logger.info("읽어온 입력한과제 list.size={}", list.size());
		
		return list;
		
	}
	
	@RequestMapping(value = "/assignUpload", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String AssignUpload(@ModelAttribute AssignmentVO vo ,
			Principal principal, HttpServletRequest request) {
			logger.info("pdf업로드 페이지");
			MemberDetails user = (MemberDetails)((Authentication)principal).getPrincipal();		
			String stuNo = user.getOfficialNo();
			
			/* List<MultipartFile> fileList = mtfRequest.getFiles("files"); */
			String result="파일 등록 실패";
			logger.info("vo.getAssignNo={}", vo.getAssignNo());
			/* logger.info("dataform={}", fileList); */
			List<Map<String, Object>> list = fileUploadUtil.fileUpload(request, FileUploadUtil.PATH_DOC);
			for (Map<String, Object> map : list) {
				vo.setOriginalFileName((String) map.get("originalFName"));
				vo.setFileSize((long) map.get("fileSize"));
				vo.setFileName((String) map.get("fileName"));
				vo.setStuNo(stuNo);
				
				int cnt = assignServ.assignUpload(vo);
				
				if(cnt > 0) {
					result="파일등록 성공";
				}
				
			}
			
			
	       
	        return result;
	}
	
	@RequestMapping("/distAssign")
	public String distAssign(Principal principal, Model model) {
		MemberDetails user = (MemberDetails)((Authentication)principal).getPrincipal();
		String profNo = user.getOfficialNo();
		//select option에 들어갈 list
		List<Map<String, Object>> list = evaluationServ.subjectByProfNo(profNo);
		model.addAttribute("list", list);
		
		
		return "assignment/distAssign";
	}
	
	
	@RequestMapping(value = "getAssigned", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	@ResponseBody
	public List<Distribute_assignVO> getAssigned(@RequestParam String openSubCode){
		logger.info("등록한 과제 목록 받아가기");
		List<Distribute_assignVO> list = assignServ.getDistAssign(openSubCode);
		logger.info("list.size={}", list.size());
		return list;
	}
	
	
	
	
}
