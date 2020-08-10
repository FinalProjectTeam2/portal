package com.will.portal.department.model;

import java.util.List;
import java.util.Map;

import com.will.portal.common.SearchVO;

public interface DepartmentService {

	List<DepartmentVO> selectDepartment();
	List<DepartmentVO> selectDepartmentByFaculty(int facultyNo);
	public List<Map<String, Object>> selectDepartmentView(SearchVO searchVo);
	public int selectTotalRecord(SearchVO searchVo);
}
