package com.will.portal.registration.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.will.portal.common.RegistrationSearchVO;
import com.will.portal.department.model.DepartmentVO;
import com.will.portal.faculty.model.FacultyVO;

@Service
public class RegistraitionServiceImpl implements RegistrationService{
	@Autowired
	private RegistrationDAO registrationDao;

	@Override
	public List<FacultyVO> selectFaculty() {
		return registrationDao.selectFaculty();
	}

	@Override
	public List<DepartmentVO> selectDepartment(int facultyNo) {
		return registrationDao.selectDepartment(facultyNo);
	}

	@Override
	public List<OpenSubjListVO> openSubjList(RegistrationSearchVO vo) {
		return registrationDao.openSubjList(vo);
	}

	@Override
	public List<String> selectRegisted(String stuNo) {
		return registrationDao.selectRegisted(stuNo);
	}

	@Override
	public List<OpenSubjListVO> registedList(List<String> list) {
		return registrationDao.registedList(list);
	}

	@Override
	public int countForDup(Map<String, Object> map) {
		return registrationDao.countForDup(map);
	}

	@Override
	@Transactional
	public int insertReg(Map<String, Object> map) {
		int cnt=0;
		cnt = registrationDao.insertReg(map);
		cnt = registrationDao.insertEval(map);
		return cnt; 
	}

	@Override
	@Transactional
	public int deleteReg(Map<String, Object> map) {
		
		int cnt = 0;
		cnt=registrationDao.deleteEval(map);
		cnt=registrationDao.deleteReg(map);
		return cnt;
	}

	@Override
	public int openSubjCount(RegistrationSearchVO vo) {
		return registrationDao.openSubjCount(vo);
	}

	@Override
	public List<String> codeListByStuNo(String stuNo) {
		return registrationDao.codeListByStuNo(stuNo);
	}

	@Override
	public String shortNameByCode(String openSubCode) {
		return registrationDao.shortNameByCode(openSubCode);
	}
	
	
	
	
	
}
