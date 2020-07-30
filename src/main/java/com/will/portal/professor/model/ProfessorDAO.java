package com.will.portal.professor.model;

import java.util.List;

import com.will.portal.subj_time.model.Subj_timeVO;
import com.will.portal.subject.model.SubjectVO;

public interface ProfessorDAO {
	int insertProfessor(ProfessorVO profVo);
	public String selectPwd(String profNo);
	public ProfessorVO selectByProfNo(String profNo);
	public String selectSsn(String officialNo);
	List<SubjectVO> loadByProfNo(String profNo);
	List<Subj_timeVO> timeByCode(List<String> codeList);
	List<String> codeByProfNo(String profNo);
	int insertSubjTime(Subj_timeVO vo);
	
	
}
