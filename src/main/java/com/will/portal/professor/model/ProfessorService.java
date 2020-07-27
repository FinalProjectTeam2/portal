package com.will.portal.professor.model;

public interface ProfessorService {
	//로그인 처리 관련 상수
	int LOGIN_OK=1;
	int PWD_DISAGREE=2;
	int ID_NONE=3;
	
	public int loginCheck(String officicalNo, String pwd);
	public ProfessorVO selectByProfNo(String profNo);
}
