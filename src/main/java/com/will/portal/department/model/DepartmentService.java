package com.will.portal.department.model;

import java.util.List;

public interface DepartmentService {

	List<DepartmentVO> selectDepartment();
	List<DepartmentVO> selectDepartmentByFaculty(int facultyNo);
}
