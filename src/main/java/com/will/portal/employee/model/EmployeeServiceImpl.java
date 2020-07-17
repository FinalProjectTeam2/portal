package com.will.portal.employee.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmployeeServiceImpl implements EmployService{
	@Autowired
	private EmployeeDAO employeeDao;
}
