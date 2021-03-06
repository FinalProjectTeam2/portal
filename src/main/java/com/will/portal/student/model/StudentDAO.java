package com.will.portal.student.model;

import java.util.List;
import java.util.Map;

import com.will.portal.common.ScoreSearchVO;
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
	int deleteStudent(String stuNo);
	int updateStudent(StudentVO studentVO);
	int updateMajor(StudentVO studentVo);
	List<StudentTimeTableVO> selectTimetable(String stuNo);
	List<Map<String, Object>> selectScore(ScoreSearchVO scoreSearchVo);
	List<String> selectSemester(String stuNo);
	List<StudentVO> selectListByName(String name);
}
