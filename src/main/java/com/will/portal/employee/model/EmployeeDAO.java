package com.will.portal.employee.model;

public interface EmployeeDAO {

	int selectSeq(int sort);
	int insertEmployee(EmployeeVO employeeVo);
	
}
