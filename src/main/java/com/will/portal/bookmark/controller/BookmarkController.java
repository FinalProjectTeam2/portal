package com.will.portal.bookmark.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
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
}
