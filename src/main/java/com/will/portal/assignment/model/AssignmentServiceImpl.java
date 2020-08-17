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

	@Override
	public int assignUpload(AssignmentVO vo) {
		return assignDao.assignUpload(vo);
	}

	@Override
	public List<Map<String, Object>> assignStuList(Distribute_assignVO vo) {
		return assignDao.assignStuList(vo);
	}

	@Override
	public int inputAssign(Distribute_assignVO vo) {
		return assignDao.inputAssign(vo);
	}

	@Override
	public int delAssign(Distribute_assignVO vo) {
		int cnt = 0;
		cnt = assignDao.delAssignStu(vo);
		cnt = assignDao.delAssign(vo);
		
		return cnt;
	}
	
	

}
