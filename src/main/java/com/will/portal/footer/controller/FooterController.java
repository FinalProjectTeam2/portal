package com.will.portal.footer.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.will.portal.footer.model.FooterService;
import com.will.portal.footer.model.FooterVo;

@Controller
public class FooterController {
	@Autowired
	private static final Logger logger = LoggerFactory.getLogger(FooterController.class);
	@Autowired
	private FooterService footerService;
	
	@RequestMapping(value="/admin/bottomEdit", method = RequestMethod.GET)
	public String footerEdit_get(Model model) {
		FooterVo vo = footerService.selectByCompany("척척학사");
		logger.info("footer수정화면 보여주기");
		model.addAttribute("vo", vo);
		return "/admin/bottomEdit";
	}
	
	@RequestMapping(value="/admin/bottomEdit", method = RequestMethod.POST)
	@ResponseBody
	public boolean footerEdit_post(@ModelAttribute FooterVo vo) {
		logger.info("footer 수정처리 하기");
		boolean bool = false;
		int cnt = footerService.updateFooter(vo);
		if(cnt > 0) {
			bool = true;
		}
		return bool;
	}
	
	@RequestMapping("/admin/ajax/foot")
	@ResponseBody
	public FooterVo forFooter() {
		FooterVo vo =footerService.selectByCompany("척척학사");
		return vo;
	}
	
	
	
	
	
	
}
