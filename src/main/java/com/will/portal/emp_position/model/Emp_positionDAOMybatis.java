package com.will.portal.emp_position.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Emp_positionDAOMybatis implements Emp_positionDAO{
	private String namespace="config.mybatis.mapper.oracle.emp_position.";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Emp_positionVO> selectEmpPosition() {
		return sqlSession.selectList(namespace +"selectEmpPosition");
	}
	
}
