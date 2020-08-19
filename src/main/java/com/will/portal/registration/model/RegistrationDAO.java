package com.will.portal.registration.model;

import java.util.List;
import java.util.Map;

import com.will.portal.common.RegistrationSearchVO;
import com.will.portal.department.model.DepartmentVO;
import com.will.portal.faculty.model.FacultyVO;
 

public interface RegistrationDAO {
	List<FacultyVO> selectFaculty();
	List<DepartmentVO> selectDepartment(int facultyNo);
	List<OpenSubjListVO> openSubjList(RegistrationSearchVO vo);
	List<String> selectRegisted(String stuNo);
	List<OpenSubjListVO> registedList(List<String> list);
	int countForDup(Map<String, Object> map);
	int insertReg(Map<String, Object> map);
	int deleteReg(Map<String, Object> map);
	int insertEval(Map<String, Object> map);
	int deleteEval(Map<String, Object> map);
	int openSubjCount(RegistrationSearchVO vo);
	List<String> codeListByStuNo(String stuNo);
	String shortNameByCode(String openSubCode);
}
