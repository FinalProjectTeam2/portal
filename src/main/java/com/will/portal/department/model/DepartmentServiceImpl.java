package com.will.portal.department.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DepartmentServiceImpl implements DepartmentService{
	@Autowired
	private DepartmentDAO departmentDao;

	@Override
	public List<DepartmentVO> selectDepartment() {
		return departmentDao.selectDepartment();
	}

	@Override
	public List<DepartmentVO> selectDepartmentByFaculty(int facultyNo) {
		return departmentDao.selectDepartmentByFaculty(facultyNo);
	}
	
}
