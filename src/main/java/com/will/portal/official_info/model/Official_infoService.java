package com.will.portal.official_info.model;

import com.will.portal.professor.model.ProfessorVO;
import com.will.portal.student.model.StudentVO;
import com.will.portal.test.model.ForPwdVO;

public interface Official_infoService {
	Official_infoVO selectByNo(String officialNo);
	StudentVO selectStuByNo(String officialNo);
	int updateCode(StudentVO vo);
	String selectCode(String stuNo);
	int updateIdentState(String stuNo);
	int insertOfficial(Official_infoVO officialVo);
	int findPwd(ForPwdVO vo);
	int updateAnyPwd(ForPwdVO vo);
	String selectSsn(String officialNo);
	int updateCodeP(ProfessorVO vo);
	String selectCodeP(String profNo);
	int updateIdentStateP(String profNo);
	int updateOfficialInfo(Official_infoVO offiVo);
}
