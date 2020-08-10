package com.will.portal.department.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.will.portal.common.SearchVO;

@Service
public class DepartmentServiceImpl implements DepartmentService{
	@Autowired
	private DepartmentDAO departmentDao;

	@Override
	public List<DepartmentVO> selectDepartment() {
		return departmentDao.selectDepartment();
	}

	@Override
	public List<DepartmentVO> selectDepartmentByFaculty(int facultyNo) {
		return departmentDao.selectDepartmentByFaculty(facultyNo);
	}

	@Override
	public List<Map<String, Object>> selectDepartmentView(SearchVO searchVo) {
		return departmentDao.selectDepartmentView(searchVo);
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return departmentDao.selectTotalRecord(searchVo);
	}
	
}
