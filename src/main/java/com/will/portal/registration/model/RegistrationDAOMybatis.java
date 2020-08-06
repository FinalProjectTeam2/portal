package com.will.portal.registration.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.portal.department.model.DepartmentVO;
import com.will.portal.faculty.model.FacultyVO;
import com.will.portal.registration.controller.RegistrationSearchVO;

@Repository
public class RegistrationDAOMybatis implements RegistrationDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.registration.";
	
	@Override
	public List<FacultyVO> selectFaculty() {
		return sqlSession.selectList(namespace+"selectFaculty");
	}

	@Override
	public List<DepartmentVO> selectDepartment(int facultyNo) {
		return sqlSession.selectList(namespace+"selectDepartment", facultyNo);
	}

	@Override
	public List<OpenSubjListVO> openSubjList() {
		return sqlSession.selectList(namespace+"openSubjList");
	}
	
	
	
	
	

}
