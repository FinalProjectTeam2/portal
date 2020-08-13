package com.will.portal.assignment.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AssignmentServiceImpl implements AssignmentService{
	@Autowired
	private AssignmentDAO assignDao;

	@Override
	public List<Map<String, Object>> subjByStuNo(String stuNo) {
		return assignDao.subjByStuNo(stuNo);
	}

	@Override
	public List<Distribute_assignVO> getDistAssign(String openSubCode) {
		return assignDao.getDistAssign(openSubCode);
	}
	
	

}
