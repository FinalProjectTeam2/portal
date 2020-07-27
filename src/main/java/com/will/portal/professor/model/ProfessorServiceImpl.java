package com.will.portal.professor.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProfessorServiceImpl implements ProfessorService{
	@Autowired
	private ProfessorDAO professorDao;

	@Override
	public int loginCheck(String officicalNo, String pwd) {
		String dbPwd = professorDao.selectPwd(officicalNo);
		int result = 0;
		if(dbPwd != null && !dbPwd.isEmpty() ) {
			if(pwd.equals(dbPwd)) {
				result = LOGIN_OK;
			}else {
				result = PWD_DISAGREE;
			}
		}else {
			result = ID_NONE;
		}
		
		return result;
	}

	@Override
	public ProfessorVO selectByProfNo(String profNo) {
		return professorDao.selectByProfNo(profNo);
	}
}
