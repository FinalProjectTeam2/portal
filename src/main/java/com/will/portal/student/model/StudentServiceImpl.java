package com.will.portal.student.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.will.portal.common.model.CommonDAO;
import com.will.portal.official_info.model.Official_infoDAO;
import com.will.portal.official_info.model.Official_infoVO;

@Service
public class StudentServiceImpl implements StudentService{

	@Autowired StudentDAO studentDao;
	@Autowired CommonDAO commonDao;
	@Autowired Official_infoDAO officialDao;

	@Transactional
	public int insertStudent(StudentVO studentVo, Official_infoVO officialVo, int sort) {

		int seq = commonDao.selectSeq(sort);

		SimpleDateFormat format1 = new SimpleDateFormat("yyyy");
		Date time = new Date();

		String userNo = format1.format(time) + sort + String.format("%03d", studentVo.getMajor())
				+ String.format("%04d", seq);
		studentVo.setStuNo(userNo);
		studentVo.setPwd("0000");

		int cnt = studentDao.insertStudent(studentVo);

		int cnt2 = 0;
		if (cnt > 0) {

			officialVo.setOfficialNo(userNo);
			cnt2 = officialDao.insertOfficial(officialVo);
		}
		return cnt2;
	}

	@Override
	public int loginCheck(String officicalNo, String pwd) {
		String dbPwd = studentDao.selectPwd(officicalNo);
		int result = 0;
		if(dbPwd != null && !dbPwd.isEmpty() ) {
			if(pwd.equals(dbPwd)) {
				result = LOGIN_OK;
			}else {
				result = PWD_DISAGREE;
			}
		}else {
			result = ID_NONE;
		}

		return result;
	}

	@Override
	public StudentVO selectByStuNo(String stuNo) {
		return studentDao.selectByStuNo(stuNo);
	}

}
