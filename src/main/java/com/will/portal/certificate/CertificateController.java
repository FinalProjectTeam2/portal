package com.will.portal.certificate;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/certificate")
public class CertificateController {
	private static final Logger logger = LoggerFactory.getLogger(CertificateController.class);

	@RequestMapping(value="/certificate1",method = RequestMethod.GET) 
	public String certificate1_get() {
		return "portal/certificate/certificate1";
	}

	@RequestMapping(value="/certificate2",method = RequestMethod.GET) 
	public String certificate2_get() {
		return "portal/certificate/certificate2";
	}
	
	@RequestMapping(value="/certificate3",method = RequestMethod.GET) 
	public String certificate3_get() {
		return "portal/certificate/certificate3";
	}
}
