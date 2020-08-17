package com.will.portal.emp_depart.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Emp_departDAOMybatis implements Emp_deaprtDAO{
	private String namespce ="config.mybatis.mapper.oracle.emp_depart.";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Emp_departVO> selectEmpDepart(){
		return sqlSession.selectList(namespce + "selectEmpDepart");
	}

	@Override
	public Emp_departVO selectEmpDepartByCode(String Code) {
		return sqlSession.selectOne(namespce+"selectEmpDepartByCode", Code);
	}
}
