package com.will.portal.employee.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.portal.common.EmployeeSearchVO;

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

	
	@Override
	public String selectSsn(String officialNo) {
		return sqlSession.selectOne(namespace+"selectSsn", officialNo);
	}

	@Override
	public Map<String, Object> selectViewByEmpNo(String officialNo) {
		return sqlSession.selectOne(namespace + "selectViewByEmpNo",officialNo);
	}

	@Override
	public List<Map<String, Object>> selectEmployeeView(EmployeeSearchVO empSearchVo) {
		return sqlSession.selectList(namespace+"selectEmployeeView",empSearchVo);
	}

	@Override
	public int getTotalRecord(EmployeeSearchVO empSearchVo) {
		return sqlSession.selectOne(namespace+"getTotalRecord",empSearchVo);
	}

	@Override
	public int updatePosition(EmployeeVO empVo) {
		return sqlSession.update(namespace+"updatePosition",empVo);
	}

	@Override
	public int deleteEmployee(String empNo) {
		return sqlSession.delete(namespace+"deleteEmployee",empNo);
	}
	
	
}

