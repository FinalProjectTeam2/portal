package com.will.portal.student.model;

public interface StudentService {
	//로그인 처리 관련 상수
	int LOGIN_OK=1;
	int PWD_DISAGREE=2;
	int ID_NONE=3;

	public int loginCheck(String officicalNo, String pwd );
	public StudentVO selectByStuNo(String stuNo);
	int insertStudent(StudentVO studentVo, Official_infoVO officialVo, int sort);
}