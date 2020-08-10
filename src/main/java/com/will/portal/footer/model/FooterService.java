package com.will.portal.footer.model;

public interface FooterService {
	FooterVo selectByCompany(String companyName);
	int updateFooter(FooterVo footerVo);
}
