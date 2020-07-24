package com.will.portal.department.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DepartmentServiceImpl implements DepartmentService{
	@Autowired
	private DepartmentDAO departmentDao;
}
