package com.will.portal.employee.model;

public interface EmployeeDAO {
	public String selectPwd(String empNo);
	public EmployeeVO selectByEmpNo(String empNo);
}
