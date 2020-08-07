package com.will.portal.student.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.portal.common.StudentSearchVO;

@Repository
public class StudentDAOMybatis implements StudentDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace = "config.mybatis.mapper.oracle.student.";
	private String namespaceAdmin="config.mybatis.mapper.oracle.admin.";

	@Override
	public int insertStudent(StudentVO studentVo) {
		return sqlSession.insert(namespaceAdmin+"insertStudent",studentVo);
	}

	public String selectPwd(String stuNo) {
		return sqlSession.selectOne(namespace + "selectPwd", stuNo);
	}

	@Override
	public StudentVO selectByStuNo(String stuNo) {
		return sqlSession.selectOne(namespace + "selectByStuNo", stuNo);
	}

	@Override
	public String selectSsn(String officialNo) {
		return sqlSession.selectOne(namespace+"selectSsn", officialNo);
	}

	@Override
	public Map<String, Object> selectViewByStuNo(String stuNo) {
		return sqlSession.selectOne(namespace +"selectViewByStuNo", stuNo);
	}

	@Override
	public List<StudentVO> selectStudent() {
		return sqlSession.selectList(namespace+"selectStudent");
	}

	@Override
	public List<Map<String, Object>> selectStudentView(StudentSearchVO studentSearchVo) {
		return sqlSession.selectList(namespace+"selectStudentView", studentSearchVo);
	}

	@Override
	public int getTotalRecord(StudentSearchVO studentSearchVo) {
		return sqlSession.selectOne(namespace+"getTotalRecord",studentSearchVo);
	}

	@Override
	public int updateStudentState(StudentVO studentVO) {
		return sqlSession.update(namespace + "updateStudentState",studentVO);
	}

	@Override
	public int deleteStudent(String stuNo) {
		return sqlSession.delete(namespace + "deleteStudent",stuNo);
	}

	@Override
	public int updateStudent(StudentVO studentVO) {
		return sqlSession.update(namespace + "updateStudent", studentVO);
	}
	
}
