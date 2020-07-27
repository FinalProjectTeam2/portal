package com.will.portal.employee.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmployeeServiceImpl implements EmployService{
	@Autowired
	private EmployeeDAO employeeDao;

	@Override
	public int loginCheck(String officicalNo, String pwd) {
	
		String dbPwd = employeeDao.selectPwd(officicalNo);
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
	public EmployeeVO selectByEmpNo(String empNo) {
		return employeeDao.selectByEmpNo(empNo);
	}
}
