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
import org.springframework.web.multipart.MultipartFile;

import com.will.portal.SearchController;
import com.will.portal.account_info.model.Account_infoVO;
import com.will.portal.bank.model.BankService;
import com.will.portal.bank.model.BankVO;
import com.will.portal.common.FileUploadUtil;
import com.will.portal.common.MemberDetails;
import com.will.portal.files.model.FilesService;
import com.will.portal.official_info.model.Official_infoService;
import com.will.portal.official_info.model.Official_infoVO;
import com.will.portal.student.model.StudentService;
@Controller
@RequestMapping("/student")
public class StudentController {
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	@Autowired private StudentService studentService;
	@Autowired private BankService bankService;
	@Autowired private Official_infoService offiService;
	@Autowired private FileUploadUtil fileUploadUtil;
	@Autowired private FilesService filesService;
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
		List<BankVO> bankList = bankService.selectAllBank();
		model.addAttribute("bankList", bankList);
		
		return "/student/studentEdit";
	}
	
	
	 @RequestMapping(value = "/studentEdit" , method = RequestMethod.POST)
	 @ResponseBody
	 public boolean edit_post(Principal principal, Model model, 
			 @ModelAttribute Account_infoVO accInfoVo,
			 @ModelAttribute Official_infoVO offiVo,
			 @RequestParam String hp,
			 @RequestParam String email,
			 @RequestParam MultipartFile upfile,
			HttpServletRequest request) {
		boolean bool = false;
		logger.info("upfile={}" , upfile);
		MemberDetails user = (MemberDetails) ((Authentication)principal).getPrincipal();
		String officialNo = user.getOfficialNo();
		accInfoVo.setOfficialNo(officialNo);
		offiVo.setOfficialNo(officialNo);
		String[] emailarr = email.split("@");
		String email1 =emailarr[0], email2=emailarr[1];
		String[] hparr = hp.split("-");
		String hp1 = hparr[0] ,hp2=hparr[1] , hp3=hparr[2] ;
		offiVo.setEmail1(email1);
		offiVo.setEmail2(email2);
		offiVo.setHp1(hp1);
		offiVo.setHp2(hp2);
		offiVo.setHp3(hp3);
		
		//파일 업로드 처리
		List<Map<String, Object>> fileList
		=fileUploadUtil.fileUpload(request, FileUploadUtil.PATH_IMAGE);

			for(Map<String, Object> map : fileList) {
				offiVo.setImageUrl((String)map.get("fileName"));
			}
			
			int cnt1 = bankService.updateAccount(accInfoVo);
			int cnt2 = offiService.updateOfficialInfo(offiVo);
			if(cnt1 > 0 && cnt2 >0) {
				bool = true;
			}
			
		return bool;
	 }
	 
	 @RequestMapping("/selectInfo")
	 @ResponseBody
	 public Map<String, Object> body(Principal principal,HttpServletRequest request) {
		 MemberDetails user = (MemberDetails) ((Authentication)principal).getPrincipal();
		 String officialNo = user.getOfficialNo();
		 Map<String, Object> map = studentService.selectViewByStuNo(officialNo);
		 String uploadPath = fileUploadUtil.getUploadPath(request, FileUploadUtil.PATH_IMAGE);
		 map.put("uploadPath",uploadPath + "\\" + map.get("IMAGE_URL"));
		 logger.info("uploadPath={}",map.get("uploadPath"));
		 return map;
		 //C:\lecture\java\workspace_list\final_ws\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\portal\pd_images
		//C:\lecture\java\workspace_list\final_ws\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\portal\pd_images\hsLogo_20200731160018585.png
	 }
	
	
	
}
