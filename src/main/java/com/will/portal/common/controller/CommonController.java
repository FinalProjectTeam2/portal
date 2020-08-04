package com.will.portal.common.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.will.portal.common.MemberDetails;
import com.will.portal.department.model.DepartmentService;
import com.will.portal.department.model.DepartmentVO;
import com.will.portal.employee.model.EmployService;
import com.will.portal.professor.model.ProfessorService;
import com.will.portal.student.model.StudentService;

@Controller
@RequestMapping("/common")
public class CommonController {

	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);

	@Autowired
	DepartmentService departmentService;

	@Autowired
	EmployService employService;

	@Autowired
	StudentService studentService;

	@Autowired
	ProfessorService professorService;

	//
	@RequestMapping("/departmentList")
	@ResponseBody
	public List<DepartmentVO> departmentList(@RequestParam(defaultValue = "0") int facultyNo) {
		logger.info("ajax-departmentList, param: {}", facultyNo);

		List<DepartmentVO> departmentList = departmentService.selectDepartmentByFaculty(facultyNo);

		logger.info("@@@{}",departmentList);
		return departmentList;
	}

	@RequestMapping("/ajax/member")
	@ResponseBody
	public MemberDetails memberByno(@RequestParam String officialNo) {
		String num = officialNo.substring(4, 5);
		logger.info("ajax - member 호출, 파라미터 officialNo={}",officialNo);

		MemberDetails user = null;

		switch (Integer.parseInt(num)) {
		case 1:
			user = employService.selectByEmpNo(officialNo);
			break;
		case 2:
			user = professorService.selectByProfNo(officialNo);
			break;
		default:
			user = studentService.selectByStuNo(officialNo);
			break;
		}

		return user;
	}

	   @RequestMapping("/image")
	   public ResponseEntity<byte[]> displayImage(@RequestParam String img,
	         HttpSession session) {
	      InputStream is = null;
	      ResponseEntity<byte[]> entity = null;
	      logger.info("FILE NAME : " + img);
	      String uploadPath =session.getServletContext().getRealPath("pd_images");

	      try {
	         String formatName = img.substring(img.lastIndexOf(".") + 1);
	         MediaType mType = getMediaType(formatName);
	         HttpHeaders headers = new HttpHeaders();
	         File file = new File(uploadPath, img);
	         if(!file.exists()) {
	            entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
	         }

	         is = new FileInputStream(file);

	         headers.setContentType(mType);

	         entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(is), headers, HttpStatus.CREATED);

	      } catch (FileNotFoundException e) {
	         e.printStackTrace();
	         entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
	      } catch (IOException e) {
	         e.printStackTrace();
	         entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
	      } finally {
	         if(is != null)
	            try {
	               is.close();
	            } catch (IOException e) {
	               e.printStackTrace();
	            }
	      }

	      return entity;
	   }

	   public static MediaType getMediaType(String type) {
	      Map<String, MediaType> mediaMap;

	      mediaMap = new HashMap<String, MediaType>();
	      mediaMap.put("jpg", MediaType.IMAGE_JPEG);
	      mediaMap.put("gif", MediaType.IMAGE_GIF);
	      mediaMap.put("png", MediaType.IMAGE_PNG);

	      return mediaMap.get(type);


	   }
}
