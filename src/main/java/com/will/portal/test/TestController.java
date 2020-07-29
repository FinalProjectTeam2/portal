package com.will.portal.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/test")
public class TestController {
	
	@RequestMapping(value="/chartTest", method = RequestMethod.GET) 
	public String chartTest_get() {
		return "test/chartTest";
	}
	
	@RequestMapping(value="/chartTest2", method = RequestMethod.GET) 
	public String chartTest2_get() {
		return "test/chartTest2";
	}
	
	@RequestMapping(value="/excelTest", method = RequestMethod.GET) 
	public String excelTest_get() {
		return "test/excelTest";
	}
	
	@RequestMapping(value="/processFileUpload", method = RequestMethod.GET) 
	public String processFileUpload_get() {
		return "test/processFileUpload";
	}
	
	@RequestMapping(value="/adminRegisterMember", method = RequestMethod.GET) 
	public String adminRegisterMember() {
		return "test/adminRegisterMember";
	}
	
	

}
