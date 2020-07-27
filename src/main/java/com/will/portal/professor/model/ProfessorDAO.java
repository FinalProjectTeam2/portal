package com.will.portal.professor.model;

public interface ProfessorDAO {
	public String selectPwd(String profNo);
	public ProfessorVO selectByProfNo(String profNo);
}
