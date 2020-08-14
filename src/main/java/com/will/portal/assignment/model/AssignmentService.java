package com.will.portal.assignment.model;

import java.util.List;
import java.util.Map;

public interface AssignmentService {
	List<Map<String, Object>> subjByStuNo(String stuNo);
	List<Distribute_assignVO> getDistAssign(String openSubCode);
	int assignUpload(AssignmentVO vo);
}
