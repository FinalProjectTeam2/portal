package com.will.portal.emp_depart.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Emp_departServiceImpl implements Emp_departService{
	@Autowired
	private Emp_deaprtDAO dao;
	
	public List<Emp_departVO> selectEmpDepart(){
		return dao.selectEmpDepart();
	}
}
