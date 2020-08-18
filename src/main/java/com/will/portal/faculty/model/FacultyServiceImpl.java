package com.will.portal.faculty.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FacultyServiceImpl implements FacultyService{
	@Autowired
	private FacultyDAO facultyDao;
	
	public List<FacultyVO> selectFaculty() {
		return facultyDao.selectFaculty();
	}

	@Override
	public List<Map<String, Object>> selectFacultyView() {
		return facultyDao.selectFacultyView();
	}

	@Override
	public Map<String, Object> selectFacultyViewBydepNo(int depNo) {
		return facultyDao.selectFacultyViewBydepNo(depNo);
	}

	@Override
	public FacultyVO selectFacultyByFacultyNo(int facultyNo) {
		return facultyDao.selectFacultyByFacultyNo(facultyNo);
	}

	@Override
	public int updateFacultyName(FacultyVO facultyVo) {
		return facultyDao.updateFacultyName(facultyVo);
	}

	@Override
	public int insertFaculty(FacultyVO facultyVo) {
		return facultyDao.insertFaculty(facultyVo);
	}
}
