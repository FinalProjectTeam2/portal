package com.will.portal.student.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
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


}
