package com.will.portal.faculty.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FacultyServiceImpl implements FacultyService{
	@Autowired
	private FacultyDAO facultyDao;
	
	public List<FacultyVO> selectFaculty() {
		return facultyDao.selectFaculty();
	}
}
