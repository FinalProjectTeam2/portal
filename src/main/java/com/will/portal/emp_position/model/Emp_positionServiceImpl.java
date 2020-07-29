package com.will.portal.emp_position.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Emp_positionServiceImpl implements Emp_positionService{
	@Autowired
	private Emp_positionDAO dao;
	
	public List<Emp_positionVO> selectEmpPosition(){
		return dao.selectEmpPosition();
	}
}
