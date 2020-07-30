package com.will.portal.student.model;

import java.util.Map;

public interface StudentDAO {

	int insertStudent(StudentVO studentVo);
	public String selectPwd(String stuNo);
	public StudentVO selectByStuNo(String stuNo);
	String selectSsn(String officialNo);
	Map<String, Object> selectViewByStuNo(String stuNo);
}
