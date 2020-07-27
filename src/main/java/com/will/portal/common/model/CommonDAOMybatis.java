package com.will.portal.common.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommonDAOMybatis implements CommonDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace = "";
	private String namespaceAdmin = "config.mybatis.mapper.oracle.admin.";

	@Override
	public int selectSeq(int sort) {

		return sqlSession.selectOne(namespaceAdmin + "selectSeq", sort);
	}

}
