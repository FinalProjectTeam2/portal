package com.will.portal.footer.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FooterServiceImpl implements FooterService{
	@Autowired
	private FooterDAO dao;
	
	@Override
	public FooterVo selectByCompany(String companyName) {
		return dao.selectByCompany(companyName);
	}

	@Override
	public int updateFooter(FooterVo footerVo) {
		return dao.updateFooter(footerVo);
	}
	
}
