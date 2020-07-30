package com.will.portal.professor.model;

import java.util.List;

import com.will.portal.subject.model.SubjectVO;

public interface ProfessorDAO {
	int insertProfessor(ProfessorVO profVo);
	public String selectPwd(String profNo);
	public ProfessorVO selectByProfNo(String profNo);
	public String selectSsn(String officialNo);
	List<SubjectVO> loadByProfNo(String profNo);
}
