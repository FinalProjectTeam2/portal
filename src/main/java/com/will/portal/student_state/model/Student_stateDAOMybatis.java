package com.will.portal.student_state.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Student_stateDAOMybatis implements Student_stateDAO{
	@Autowired
	private SqlSessionTemplate sqlsession;

	private String namespace="config.mybatis.mapper.oracle.student.";

	@Override
	public List<Student_stateVO> selectStudentState() {
		return sqlsession.selectList(namespace+"selectStudentState");
	}

	
}
