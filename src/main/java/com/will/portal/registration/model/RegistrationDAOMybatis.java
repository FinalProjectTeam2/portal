package com.will.portal.registration.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.portal.common.RegistrationSearchVO;
import com.will.portal.department.model.DepartmentVO;
import com.will.portal.faculty.model.FacultyVO;

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
	public List<OpenSubjListVO> openSubjList(RegistrationSearchVO vo) {
		return sqlSession.selectList(namespace+"openSubjList", vo);
	}

	@Override
	public List<String> selectRegisted(String stuNo) {
		return sqlSession.selectList(namespace+"selectRegisted", stuNo);
	}

	@Override
	public List<OpenSubjListVO> registedList(List<String> list) {
		return sqlSession.selectList(namespace+"registedList", list);
	}

	@Override
	public int countForDup(Map<String, Object> map) {
		return sqlSession.selectOne(namespace+"countForDup", map);
	}

	@Override
	public int insertReg(Map<String, Object> map) {
		return sqlSession.insert(namespace+"insertReg", map);
	}

	@Override
	public int deleteReg(Map<String, Object> map) {
		return sqlSession.delete(namespace+"deleteReg", map);
	}

	@Override
	public int insertEval(Map<String, Object> map) {
		return sqlSession.insert(namespace+"insertEval", map);
	}

	@Override
	public int deleteEval(Map<String, Object> map) {
		return sqlSession.delete(namespace+"deleteEval", map);
	}

	@Override
	public int openSubjCount(RegistrationSearchVO vo) {
		return sqlSession.selectOne(namespace+"openSubjCount", vo);
	}
	
	
	
	
	

}
