package com.will.portal.student.model;

public interface StudentDAO {
	public String selectPwd(String stuNo);
	public StudentVO selectByStuNo(String stuNo);
}
