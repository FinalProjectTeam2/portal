package com.will.portal.registration.model;

import java.util.List;
import java.util.Map;

import com.will.portal.department.model.DepartmentVO;
import com.will.portal.faculty.model.FacultyVO;
import com.will.portal.registration.controller.RegistrationSearchVO;

public interface RegistrationDAO {
	List<FacultyVO> selectFaculty();
	List<DepartmentVO> selectDepartment(int facultyNo);
	List<OpenSubjListVO> openSubjList();
}
