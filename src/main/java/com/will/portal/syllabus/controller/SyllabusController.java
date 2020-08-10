package com.will.portal.syllabus.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.will.portal.common.FileUploadUtil;
import com.will.portal.common.MemberDetails;
import com.will.portal.files.model.FilesService;
import com.will.portal.professor.model.ProfessorService;
import com.will.portal.subject.model.SubjectAllVO;
import com.will.portal.syllabus.model.SyllabusService;
import com.will.portal.syllabus.model.SyllabusVO;


@Controller
public class SyllabusController {
	private static final Logger logger = LoggerFactory.getLogger(SyllabusController.class);
	@Autowired private FileUploadUtil fileUploadUtil;
	@Autowired private FilesService filesService;
	@Autowired private ProfessorService profService;
	@Autowired private SyllabusService syllabusService;
	
	@RequestMapping(value = "/syllabus/upload", method = RequestMethod.GET)
    public String syllabusUpload(Principal principal, Model model) {
		logger.info("교수 pdf 업로드 페이지");
		MemberDetails user = (MemberDetails) ((Authentication)principal).getPrincipal();
		String profNo = user.getOfficialNo();
		
		List<SubjectAllVO> list = profService.loadByProfNo(profNo);
		logger.info("list.size()={}", list.size());
		
		model.addAttribute("list", list);
		
		return "syllabus/upload";
		
	}
	
	
	
	
	@RequestMapping(value = "/syllabus/upload", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String syllabusUpload(MultipartHttpServletRequest mtfRequest, @ModelAttribute SyllabusVO vo ,HttpServletRequest request) {
        logger.info("pdf업로드 페이지");
        
		List<MultipartFile> fileList = mtfRequest.getFiles("files");
		String openSubjCode = vo.getOpenSubCode().substring(4);
		String result="파일 등록 실패";
		
		logger.info("vo.getTheoryTime()={}, vo.getSubjCode={}", vo.getTheoryTime(), vo.getOpenSubCode());
		logger.info("dataform={}", fileList);
		List<Map<String, Object>> list = fileUploadUtil.fileUpload(request, FileUploadUtil.PATH_PDF);
		for (Map<String, Object> map : list) {
			vo.setSyllabus((String) map.get("fileName"));
			vo.setOpenSubCode(openSubjCode);
			
			int cnt = syllabusService.insertSyllabus(vo);
			
			if(cnt > 0) {
				result="파일등록 성공";
			}
			
		}
		
		
       
        return result;
    }


}
