package com.will.portal.excel.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.will.portal.common.ExcelRead;
import com.will.portal.common.ExcelReadOption;
import com.will.portal.evaluation.model.EvaluationAllVO;

@Controller
public class ExcelTest {
	private static Logger logger = LoggerFactory.getLogger(ExcelTest.class);
	
	@RequestMapping(value = "/excelTest", produces = "application/text; charset=utf8", method = RequestMethod.GET)
	public String excelUploadAjax() {
		logger.info("execlTest화면 보여주기");
		return "excelTest/excelTest";
	}
	
	
	
	@RequestMapping(value = "/excelTest/excelUploadAjax", produces = "application/text; charset=utf8",method = RequestMethod.POST)
	@ResponseBody
	public List<EvaluationAllVO> excelUploadAjax_post(MultipartHttpServletRequest request) throws Exception{
		MultipartFile excelFile  = request.getFile("excelFile");
		logger.info("엑셀파일 업로드 테스트");
		
		if(excelFile == null || excelFile.isEmpty()) {
			throw new RuntimeException("엑셀파일을 선택해주세요");
		}
		
		File destFile = new File(excelFile.getOriginalFilename());
		
		try{
			excelFile.transferTo(destFile);
		}catch(IllegalStateException | IOException e){
			throw new RuntimeException(e.getMessage(),e);
		}
		
		
		List<EvaluationAllVO> list = excelUpload(destFile);
		
		destFile.delete();
		
		return list;
		
	}
	
	public List<EvaluationAllVO> excelUpload(File destFile) throws Exception{
		ExcelReadOption excelReadOption = new ExcelReadOption();
		excelReadOption.setFilePath(destFile.getAbsolutePath());
		excelReadOption.setOutputColumns("A","B","C","D","E","F","G","H","I","J");
		excelReadOption.setStartRow(2);
		
		List<Map<String, Object>> excelContent = ExcelRead.read(excelReadOption);
		List<EvaluationAllVO> list = new ArrayList<EvaluationAllVO>();
		EvaluationAllVO vo = new EvaluationAllVO();
		for(Map<String, Object> map : excelContent) {
			logger.info("A={}, B={}", map.get("A"), map.get("B"));
			logger.info("C={}, D={}", map.get("C"), map.get("D"));
			logger.info("E={}, F={}", map.get("E"), map.get("F"));
			logger.info("G={}, H={}", map.get("G"), map.get("H"));
			logger.info("I={}, J={}", map.get("I"), map.get("J"));
			vo.setSubCode((String)map.get("A"));
			vo.setStuNo((String)map.get("B"));
			vo.setName((String)map.get("C"));
			vo.setClassification((String)map.get("D"));
			vo.setMidterm((int)map.get("E"));
			vo.setFinals((int)map.get("F"));
			vo.setAssignment((int)map.get("G"));
			vo.setAttendance((int)map.get("H"));
			vo.setEtc((int)map.get("I"));
			vo.setTotalGrade((int)map.get("J"));
			
			list.add(vo);
		}
		
		logger.info("list.size()={}", list.size());
		return list;
	}
	
	
}
