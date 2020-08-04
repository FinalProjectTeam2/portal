package com.will.portal.student_state.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Student_stateServiceImpl implements Student_stateService{

	@Autowired
	private Student_stateDAO studentStateDao;

	@Override
	public List<Student_stateVO> selectStudentState() {
		return studentStateDao.selectStudentState();
	}
	
	
}
