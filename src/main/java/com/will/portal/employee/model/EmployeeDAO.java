package com.will.portal.employee.model;

public interface EmployeeDAO {
	int insertEmployee(EmployeeVO employeeVo);
	public String selectPwd(String empNo);
	public EmployeeVO selectByEmpNo(String empNo);
}
