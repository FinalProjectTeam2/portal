package com.will.portal.student.model;

public interface StudentDAO {

	int insertStudent(StudentVO studentVo);
	public String selectPwd(String stuNo);
	public StudentVO selectByStuNo(String stuNo);
}
