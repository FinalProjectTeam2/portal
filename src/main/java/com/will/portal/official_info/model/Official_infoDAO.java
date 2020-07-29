package com.will.portal.official_info.model;

import com.will.portal.professor.model.ProfessorVO;
import com.will.portal.student.model.StudentVO;
import com.will.portal.test.model.ForPwdVO;

public interface Official_infoDAO {
	Official_infoVO selectByNo(String officialNo);
	int countStuByNo(String officialNo);
	int countProfByNo(String officialNo);
	StudentVO selectStuByNo(String officialNo);
	ProfessorVO selectProfByNo(String officialNo);
	int updateCode(StudentVO vo);
	String selectCode(String stuNo);
	int updateIdentState(String stuNo);
	int insertOfficial(Official_infoVO officialVo);
	int findPwd(ForPwdVO vo);
	int updateAnyPwd(ForPwdVO vo);
	public String selectSsn(String officialNo);
}
