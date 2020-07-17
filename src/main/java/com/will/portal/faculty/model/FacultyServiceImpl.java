package com.will.portal.faculty.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FacultyServiceImpl implements FacultyService{
	@Autowired
	private FacultyDAO facultyDao;
}
