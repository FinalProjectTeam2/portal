package com.will.portal.bookmark.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.will.portal.bookmark.model.BookmarkService;
import com.will.portal.bookmark.model.BookmarkVO;
import com.will.portal.common.MemberDetails;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/bookmark")
public class BookmarkController {
	
	@Autowired
	private BookmarkService service;
	
	@RequestMapping("/insert")
	@ResponseBody
	public String insert(@ModelAttribute BookmarkVO vo, Authentication authentication) {
		log.info("ajax - insert 매개변수 vo={}",vo);
		MemberDetails user = (MemberDetails) authentication.getPrincipal();
		vo.setOfficialNo(user.getOfficialNo());
		int cnt = service.insertBookmark(vo);
		log.info("북마크 저장 결과 cnt={}",cnt);
		return cnt+"";
				
	}
	
	@RequestMapping("/ajax/list")
	@ResponseBody
	public List<BookmarkVO> list(Authentication authentication) {
		List<BookmarkVO> list = null;
		
		if(authentication != null) {
			MemberDetails user = (MemberDetails) authentication.getPrincipal();
			log.info("ajax - list 매개변수 user={}",user);
			
			list = service.selectByOffiNo(user.getOfficialNo());
			log.info("북마크 조회 결과 list.size={}",list.size());
		}else {
			list = new ArrayList<BookmarkVO>();
			log.info("로그인 안됨");
		}
		
		return list;
	}
	
	@RequestMapping("/manager")
	public void manager() {
		log.info("즐겨찾기 관리 페이지");
	}
	
	@RequestMapping("/edit")
	@ResponseBody
	public String edit(Authentication authentication, @ModelAttribute BookmarkVO vo) {
		MemberDetails user = (MemberDetails) authentication.getPrincipal();
		vo.setOfficialNo(user.getOfficialNo());
		log.info("ajax - edit, 매게변수 vo={}",vo);
		
		int cnt = service.updateBookmark(vo);
		log.info("북마크 수정 결과 cnt={}",cnt);
		
		return cnt+"";
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public String delete(@RequestParam(value = "chbox[]") List<String> chArr) {
		log.info("ajax - delete, 파라미터 chArr={}",chArr.toString());
		
		int cnt = 0;
		for (String no : chArr) {
			cnt += service.deleteBookmark(Integer.parseInt(no));
		}
		log.info("북마크 삭제 결과 cnt={}",cnt);
		
		return cnt+"";
	}
}
