package com.will.portal.registration.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.will.portal.department.model.DepartmentVO;
import com.will.portal.faculty.model.FacultyVO;
import com.will.portal.registration.controller.RegistrationSearchVO;

@Service
public class RegistraitionServiceImpl implements RegistrationService{
	@Autowired
	private RegistrationDAO registrationDao;

	@Override
	public List<FacultyVO> selectFaculty() {
		return registrationDao.selectFaculty();
	}

	@Override
	public List<DepartmentVO> selectDepartment(int facultyNo) {
		return registrationDao.selectDepartment(facultyNo);
	}

	@Override
	public List<OpenSubjListVO> openSubjList() {
		return registrationDao.openSubjList();
	}
	
	
	
}
