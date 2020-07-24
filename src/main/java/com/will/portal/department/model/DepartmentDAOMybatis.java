package com.will.portal.department.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DepartmentDAOMybatis implements DepartmentDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="";
	
}
