package com.will.portal.professor.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProfessorServiceImpl implements ProfessorService{
	@Autowired
	private ProfessorDAO professorDao;
}
