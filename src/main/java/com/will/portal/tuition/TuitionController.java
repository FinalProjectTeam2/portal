package com.will.portal.tuition;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.will.portal.board.controller.BoardController;
import com.will.portal.department.model.DepartmentVO;
import com.will.portal.tuition.model.TuitionAllVO;
import com.will.portal.tuition.model.TuitionService;
import com.will.portal.tuition.model.TuitionVO;

@Controller
@RequestMapping("/tuition")
public class TuitionController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired TuitionService tuitionService;
	 
	@RequestMapping(value="/tuition1", method = RequestMethod.GET) 
	public String tuition1_get() {
		return "tuition/tuition1";
	}
	

	@RequestMapping(value="/tuition2", method = RequestMethod.GET) 
	public String tuition2_get() {
		return "tuition/tuition2";
	}
	
	
	@RequestMapping(value="/tuition3", method = RequestMethod.GET) 
	public String tuition3_get() {
		return "tuition/tuition3";
	}
	
	@RequestMapping(value="/tuition4", method = RequestMethod.GET) 
	public String tuition4_get() {
		logger.info("등록금 영수증 확인");
		return "tuition/tuition4";
	}

}
