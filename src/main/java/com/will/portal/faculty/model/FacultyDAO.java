package com.will.portal.faculty.model;

import java.util.List;
import java.util.Map;

public interface FacultyDAO {
	public List<FacultyVO> selectFaculty();
	List<Map<String,Object>> selectFacultyView();
	Map<String,Object> selectFacultyViewBydepNo(int depNo);
	FacultyVO selectFacultyByFacultyNo(int facultyNo);
	int updateFacultyName(FacultyVO facultyVo);
	int insertFaculty(FacultyVO facultyVo);
}
