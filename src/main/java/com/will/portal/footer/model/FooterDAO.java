package com.will.portal.footer.model;

public interface FooterDAO {
	FooterVo selectByCompany(String companyName);
	int updateFooter(FooterVo footerVo);
}
