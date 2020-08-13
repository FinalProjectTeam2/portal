package com.will.portal.award.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AwardDAOMybatis implements AwardDAO {
	private String namespace = "config.mybatis.mapper.oracle.award.";

	@Autowired private SqlSessionTemplate sqlSession;

	@Override
	public List<AwardVO> selectAllaward() {
		return sqlSession.selectList(namespace+"selectAllaward");
	}





}
