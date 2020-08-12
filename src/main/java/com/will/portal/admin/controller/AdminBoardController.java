package com.will.portal.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.will.portal.board.model.BoardService;
import com.will.portal.board.model.BoardVO;
import com.will.portal.category.model.CategoryListVO;
import com.will.portal.category.model.CategoryVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin/board")
@Slf4j
public class AdminBoardController {
	
	@Autowired
	private BoardService service;
	
	@RequestMapping("/manager")
	public void manager() {
		log.info("게시판 관리 페이지");
	}
	@RequestMapping("/cateIn")
	public void cateIn() {
		log.info("카테고리 등록 페이지");
	}
	@RequestMapping("/boardEdit")
	public void boardEditr(@RequestParam String bdCode) {
		log.info("게시판 수정 페이지, 파라미터 bdCode={}", bdCode);
	}
	
	@RequestMapping("/getList")
	@ResponseBody
	public List<CategoryListVO> getList() {
		log.info("ajax - 카테고리 조회");
		List<CategoryListVO> list = service.selectCategoryList();
		log.info("게시판 조회 결과 list.size={}",list.size());
		
		return list;
	}
	@RequestMapping("/getBoardList")
	@ResponseBody
	public List<BoardVO> getBoardList(@RequestParam String cateCode) {
		log.info("ajax - 게시판 조회, 파라미터 cateCode={}",cateCode);
		List<BoardVO> list = service.selectBoardByCtCode(cateCode);
		log.info("게시판 조회 결과 list.size={}",list.size());
		
		return list;
	}
	@RequestMapping("/checkCateCode")
	@ResponseBody
	public String checkCateCode(@RequestParam String code) {
		code = code.toUpperCase();
		log.info("ajax - 카테고리 중복조회, 파라미터 code={}",code);
		int cnt = service.countByCateCode(code);
		String result = "N";
		if(cnt == 0) {
			result = "Y";
		}
		return result;
	}
	@RequestMapping("/insertCate")
	@ResponseBody
	public String insertCate(@ModelAttribute CategoryVO vo) {
		vo.setCategoryCode(vo.getCategoryCode().toUpperCase());
		log.info("ajax - 카테고리 등록, 파라미터 vo={}",vo);
		
		int cnt = service.insertCate(vo);
		String result = "N";
		log.info("등록 결과 cnt={}",cnt);
		if(cnt >0) {
			result = "Y";
		}
		return result;
	}
}
