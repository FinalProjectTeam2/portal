package com.will.portal.official_info.model;

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
	
}
