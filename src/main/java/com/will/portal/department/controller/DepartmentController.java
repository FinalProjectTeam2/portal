package com.will.portal.department.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.will.portal.common.PaginationInfo;
import com.will.portal.common.SearchVO;
import com.will.portal.common.Utility;
import com.will.portal.department.model.DepartmentService;


@Controller
public class DepartmentController {
	private final static Logger logger 
		= LoggerFactory.getLogger(DepartmentController.class);
	@Autowired
	private DepartmentService departmentService;
	
	@RequestMapping(value="/search/searchTel", method = RequestMethod.GET)
	public String searchTel_get() {
		logger.info("교내 전화번호 검색");
		return "/search/searchTel";
	}
	
	@RequestMapping(value = "/search/searchTel", method = RequestMethod.POST)
	public String searchTel(@ModelAttribute SearchVO searchVO, Model model) {
		logger.info("searchKeyword = {}" ,searchVO.getSearchKeyword());
		if(searchVO.getSearchKeyword() == null || searchVO.getSearchKeyword().isEmpty()) {
			return "redirect:/search/searchTel";
		}
		//페이징 처리
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVO.getCurrentPage());
		
		searchVO.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVO.setRecordCountPerPage(Utility.RECORD_COUNT);
		
		logger.info("searchVo = {}" ,searchVO);
		List<Map<String, Object>> mapList = departmentService.selectDepartmentView(searchVO);
		
		int totalRecord = departmentService.selectTotalRecord(searchVO);
		pagingInfo.setTotalRecord(totalRecord);
		logger.info("전체 레코드 개수 = {}" ,totalRecord);
		logger.info("pagingInfo = {}" , pagingInfo);
		logger.info("mapList = {}" ,mapList);
		model.addAttribute("mapList", mapList);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "/search/searchTel";
	}

}
