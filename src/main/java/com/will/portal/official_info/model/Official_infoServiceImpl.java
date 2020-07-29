package com.will.portal.official_info.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.will.portal.student.model.StudentVO;
import com.will.portal.test.model.ForPwdVO;

@Service
public class Official_infoServiceImpl implements Official_infoService{
	@Autowired
	private Official_infoDAO infoDao;

	@Override
	public Official_infoVO selectByNo(String officialNo) {
		return infoDao.selectByNo(officialNo);
	}

	@Override
	public int insertOfficial(Official_infoVO officialVo) {
		return infoDao.insertOfficial(officialVo);
	}

	@Override
	public StudentVO selectStuByNo(String officialNo) {
		return null;
	}

	@Override
	public int updateCode(StudentVO vo) {
		return infoDao.updateCode(vo);
	}

	@Override
	public String selectCode(String stuNo) {
		return infoDao.selectCode(stuNo);
	}

	@Override
	public int updateIdentState(String stuNo) {
		return infoDao.updateIdentState(stuNo);
	}

	@Override
	public int findPwd(ForPwdVO vo) {
		return infoDao.findPwd(vo);
	}

	@Override
	public int updateAnyPwd(ForPwdVO vo) {
		return infoDao.updateAnyPwd(vo);
	}

	@Override
	public String selectSsn(String officialNo) {
		return infoDao.selectSsn(officialNo);
	}
	
}
