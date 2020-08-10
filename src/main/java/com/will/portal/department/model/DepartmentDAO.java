package com.will.portal.department.model;

import java.util.List;
import java.util.Map;

import com.will.portal.common.SearchVO;

public interface DepartmentDAO {

	List<DepartmentVO> selectDepartment();
	List<DepartmentVO> selectDepartmentByFaculty(int facultyNo);
	List<Map<String, Object>>selectDepartmentView(SearchVO searchVo);
	int selectTotalRecord(SearchVO searchVo);
}
