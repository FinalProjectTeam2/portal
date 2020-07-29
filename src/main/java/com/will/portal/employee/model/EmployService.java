package com.will.portal.employee.model;

import com.will.portal.official_info.model.Official_infoVO;

public interface EmployService {
	
	int LOGIN_OK=1;
	int PWD_DISAGREE=2;
	int ID_NONE=3;

	public int loginCheck(String officicalNo, String pwd);
	public EmployeeVO selectByEmpNo(String empNo);
	int insertEmployee(EmployeeVO employeeVo, Official_infoVO officialVo, int sort);
}
