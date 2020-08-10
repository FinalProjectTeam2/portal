package com.will.portal.footer.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FooterDAOMybatis implements FooterDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.footer.";
	
	@Override
	public FooterVo selectByCompany(String companyName) {
		return sqlSession.selectOne(namespace + "selectByCompany",companyName);
	}
	@Override
	public int updateFooter(FooterVo footerVo) {
		return sqlSession.update(namespace +"updateFooter",footerVo);
	}
	
}
