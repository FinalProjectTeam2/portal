package com.will.portal.employee.model;

import java.util.Map;

public interface EmployeeDAO {
	int insertEmployee(EmployeeVO employeeVo);
	public String selectPwd(String empNo);
	public EmployeeVO selectByEmpNo(String empNo);
	public String selectSsn(String officialNo);
	Map<String, Object> selectViewByEmpNo(String empNo);
}