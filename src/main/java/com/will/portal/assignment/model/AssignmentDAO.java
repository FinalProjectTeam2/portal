package com.will.portal.assignment.model;

import java.util.List;
import java.util.Map;

public interface AssignmentDAO {
	List<Map<String, Object>> subjByStuNo(String stuNo);
	List<Distribute_assignVO> getDistAssign(String openSubCode);
	int assignUpload(AssignmentVO vo);
	List<Map<String, Object>> assignStuList(Distribute_assignVO vo);
	int inputAssign(Distribute_assignVO vo);
	int delAssign(Distribute_assignVO vo);
	int delAssignStu(Distribute_assignVO vo);
}
