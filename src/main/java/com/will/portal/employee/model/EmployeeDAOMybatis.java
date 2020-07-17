package com.will.portal.employee.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EmployeeDAOMybatis implements EmployeeDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="";
}
