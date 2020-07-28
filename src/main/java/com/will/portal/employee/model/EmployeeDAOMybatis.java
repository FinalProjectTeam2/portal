package com.will.portal.employee.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EmployeeDAOMybatis implements EmployeeDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.employee.";
	private String namespaceAdmin="config.mybatis.mapper.oracle.admin.";

	@Override
	public int insertEmployee(EmployeeVO employeeVo) {
		return sqlSession.insert(namespaceAdmin+"insertEmployee",employeeVo);
	}

	public String selectPwd(String empNo) {
		return sqlSession.selectOne(namespace + "selectPwd", empNo);
	}

	public EmployeeVO selectByEmpNo(String empNo) {
		return sqlSession.selectOne(namespace + "selectByEmpNo", empNo);
	}
}