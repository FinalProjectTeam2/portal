package com.will.portal.official_info.model;

import com.will.portal.professor.model.ProfessorVO;
import com.will.portal.student.model.StudentVO;

public interface Official_infoDAO {
	Official_infoVO selectByNo(String officialNo);
	int countStuByNo(String officialNo);
	int countProfByNo(String officialNo);
	StudentVO selectStuByNo(String officialNo);
	ProfessorVO selectProfByNo(String officialNo);
	int updateCode(StudentVO vo);
	String selectCode(String stuNo);
	int updateIdentState(String stuNo);
}
