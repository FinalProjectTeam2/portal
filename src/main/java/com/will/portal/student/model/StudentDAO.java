package com.will.portal.student.model;

import java.util.List;
import java.util.Map;

import com.will.portal.common.StudentSearchVO;

public interface StudentDAO {

	int insertStudent(StudentVO studentVo);
	public String selectPwd(String stuNo);
	public StudentVO selectByStuNo(String stuNo);
	String selectSsn(String officialNo);
	Map<String, Object> selectViewByStuNo(String stuNo);
	List<StudentVO> selectStudent();
	List<Map<String, Object>> selectStudentView(StudentSearchVO studentSearchVo);
	int getTotalRecord(StudentSearchVO studentSearchVo);
	int updateStudentState(StudentVO studentVO);
}
