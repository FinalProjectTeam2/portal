package com.will.portal.student.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudentServiceImpl implements StudentService{
	@Autowired
	private StudentDAO dao;

	@Override
	public int loginCheck(String officicalNo, String pwd) {
		String dbPwd = dao.selectPwd(officicalNo);
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
	public StudentVO selectByStuNo(String stuNo) {
		return dao.selectByStuNo(stuNo);
	}
	
}
