package com.will.portal.professor.model;

public interface ProfessorDAO {
	int insertProfessor(ProfessorVO profVo);
	public String selectPwd(String profNo);
	public ProfessorVO selectByProfNo(String profNo);
}
