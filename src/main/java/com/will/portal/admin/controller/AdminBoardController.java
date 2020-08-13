package com.will.portal.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.will.portal.authority.model.AuthorityService;
import com.will.portal.authority.model.AuthorityVO;
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
	
	@Autowired
	private AuthorityService authServ;
	
	@RequestMapping("/manager")
	public void manager() {
		log.info("게시판 관리 페이지");
	}
	@RequestMapping("/cateIn")
	public void cateIn(@RequestParam String type, @RequestParam(required = false) String code, 
			Model model) {
		log.info("카테고리 등록 페이지, 파라미터 type={}, code={}",type,code);
		model.addAttribute("type", type);
		if(type.equals("edit")) {
			CategoryVO vo = service.selectCateByCode(code);
			model.addAttribute("vo", vo);
		}
	}
	@RequestMapping("/boardEdit")
	public void boardEditr(@RequestParam String type, @RequestParam(required = false) String bdCode
			 ,@RequestParam(required = false) String cateCode, Model model) {
		log.info("게시판 등록 및 수정 페이지, 파라미터, type={}, bdCode={}",type, bdCode);
		log.info("cateCode={}",cateCode);
		if(type.equals("edit")) {
			BoardVO vo = service.selectBoardByBdCode(bdCode);
			log.info("board 정보 조회 vo={}",vo);
			model.addAttribute("vo", vo);
		}
		
		List<AuthorityVO> list = authServ.selectAuthority();
		
		model.addAttribute("cateCode", cateCode);
		model.addAttribute("list", list);
		model.addAttribute("type", type);
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
	@RequestMapping("/checkBdCode")
	@ResponseBody
	public String checkBdCode(@RequestParam String code) {
		code = code.toUpperCase();
		log.info("ajax - 게시판 중복조회, 파라미터 code={}",code);
		int cnt = service.countByBdCode(code);
		String result = "N";
		if(cnt == 0) {
			result = "Y";
		}
		return result;
	}
	@RequestMapping("/insertCate")
	@ResponseBody
	public String insertCate(@ModelAttribute CategoryVO vo) {
		log.info("ajax - 카테고리 등록, 파라미터 vo={}",vo);
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
	@RequestMapping("/insertBd")
	@ResponseBody
	public String insertBd(@ModelAttribute BoardVO vo) {
		log.info("ajax - 게시판 등록, 파라미터 vo={}",vo);
		vo.setCategoryCode(vo.getCategoryCode().toUpperCase());
		vo.setBdCode(vo.getBdCode().toUpperCase());
		if(vo.getMaxFilesize() == 0) {
			vo.setMaxFilesize(1);
		}
		if(vo.getMaxUpfile() == 0) {
			vo.setMaxUpfile(1);
		}
		log.info("ajax - 게시판 등록, 파라미터 vo={}",vo);
		
		int cnt = service.insertBoard(vo);
		String result = "N";
		log.info("등록 결과 cnt={}",cnt);
		if(cnt >0) {
			result = "Y";
		}
		return result;
	}
	@RequestMapping("/editBd")
	@ResponseBody
	public String editBd(@ModelAttribute BoardVO vo) {
		log.info("ajax - 게시판 수정, 파라미터 vo={}",vo);
		vo.setCategoryCode(vo.getCategoryCode().toUpperCase());
		vo.setBdCode(vo.getBdCode().toUpperCase());
		if(vo.getMaxFilesize() == 0) {
			vo.setMaxFilesize(1);
		}
		if(vo.getMaxUpfile() == 0) {
			vo.setMaxUpfile(1);
		}
		log.info("ajax - 게시판 수정, 파라미터 vo={}",vo);
		
		int cnt = service.updateBoard(vo);
		String result = "N";
		log.info("수정 결과 cnt={}",cnt);
		if(cnt >0) {
			result = "Y";
		}
		return result;
	}
	@RequestMapping("/editCate")
	@ResponseBody
	public String editCate(@ModelAttribute CategoryVO vo) {
		log.info("ajax - 카테고리 등록, 파라미터 vo={}",vo);
		vo.setCategoryCode(vo.getCategoryCode().toUpperCase());
		log.info("ajax - 카테고리 등록, 파라미터 vo={}",vo);
		
		int cnt = service.updateCate(vo);
		String result = "N";
		log.info("수정 결과 cnt={}",cnt);
		if(cnt >0) {
			result = "Y";
		}
		return result;
	}
	@RequestMapping("/cateDelete")
	@ResponseBody
	public String cateDelete(@RequestParam String code) {
		code = code.toUpperCase();
		log.info("ajax - 카테고리 삭제, 파라미터 code={}",code);
		int cnt = service.deleteCate(code);
		String result = "N";
		if(cnt == 0) {
			result = "Y";
		}
		return result;
	}
	@RequestMapping("/boardDelete")
	@ResponseBody
	public String boardDelete(@RequestParam(value = "chbox[]") List<String> chArr, @RequestParam String cateCode) {
		log.info("ajax - 게시판 삭제, 파라미터 chArr={}",chArr.toString());
		int cnt = 0;
		for (String code : chArr) {
			cnt += service.deleteBoard(code);
		}
		log.info("삭제 결과 cnt={}",cnt);
		return cateCode;
	}
}
