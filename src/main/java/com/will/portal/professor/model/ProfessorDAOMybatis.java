package com.will.portal.professor.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProfessorDAOMybatis implements ProfessorDAO{
	@Autowired
	private SqlSessionTemplate sqlsession;
	private String namespace="";
	private String namespaceAdmin="config.mybatis.mapper.oracle.admin.";
	
	@Override
	public int insertProfessor(ProfessorVO profVo) {
		return sqlsession.insert(namespaceAdmin+"insertProfessor",profVo);
	}
	
	
}
