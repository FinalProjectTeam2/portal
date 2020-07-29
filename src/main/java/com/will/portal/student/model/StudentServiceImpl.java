package com.will.portal.student.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.will.portal.common.model.CommonDAO;
import com.will.portal.official_info.model.Official_infoDAO;
import com.will.portal.official_info.model.Official_infoVO;

@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	StudentDAO studentDao;
	@Autowired
	CommonDAO commonDao;
	@Autowired
	Official_infoDAO officialDao;

	@Transactional
	public int insertStudent(StudentVO studentVo, Official_infoVO officialVo, int sort) {

		int seq = commonDao.selectSeq(sort);

		SimpleDateFormat format1 = new SimpleDateFormat("yyyy");
		Date time = new Date();

		String userNo = format1.format(time) + sort + String.format("%03d", studentVo.getMajor())
				+ String.format("%04d", seq);
		studentVo.setStuNo(userNo);
		studentVo.setPwd(officialVo.getSsn().substring(0, 6));

		int cnt = studentDao.insertStudent(studentVo);

		int cnt2 = 0;
		if (cnt > 0) {

			officialVo.setOfficialNo(userNo);
			cnt2 = officialDao.insertOfficial(officialVo);
		}
		return cnt2;
	}

	@Override
	public int loginCheck(String officialNo, String pwd) {
		// 최초 로그인시 비밀번호가 생년월일과 같기때문에 생년월일부터 받아온다
		String birthDay = studentDao.selectSsn(officialNo).substring(0, 6);
		String dbPwd = studentDao.selectPwd(officialNo);
		int result = 0;
		if(dbPwd != null && !dbPwd.isEmpty() ) {
			//최초로그인은 생년월일이 패스워드기 때문에 pdPwd말고 birthDay로 로그인체크
			//모든 패스워드 암호화할거기 때문에
			if(dbPwd.equals(birthDay)) {
				if(pwd.equals(dbPwd)) {
					result = LOGIN_OK;
				} else {
					result = PWD_DISAGREE;
				}
			} else {
				// 비번 변경 후에는 암호화된 dbPwd와 비교해서 로그인 처리 한다.
				if (BCrypt.checkpw(pwd, dbPwd)) {
					result = LOGIN_OK;
				} else if (!BCrypt.checkpw(pwd, dbPwd)) {
					result = PWD_DISAGREE;
				}
			}
		} else {
			result = ID_NONE;
		}

		return result;
	}

	@Override
	public StudentVO selectByStuNo(String stuNo) {
		return studentDao.selectByStuNo(stuNo);
	}

	@Override
	public Map<String, Object> selectViewByStuNo(String stuNo) {
		return studentDao.selectViewByStuNo(stuNo);
	}
	
	public boolean loginCheck(String loginPwd, String password, String officialNo) {
		// 최초 로그인시 비밀번호가 생년월일과 같기때문에 생년월일부터 받아온다
		String birthDay = studentDao.selectSsn(officialNo).substring(0, 6);
		boolean result = false;
		if (password != null && !password.isEmpty()) {
			// 최초로그인은 생년월일이 패스워드기 때문에 pdPwd말고 birthDay로 로그인체크
			// 모든 패스워드 암호화할거기 때문에
			if (password.equals(birthDay)) {
				if (loginPwd.equals(password)) {
					result = true;
				}
			} else {
				// 비번 변경 후에는 암호화된 dbPwd와 비교해서 로그인 처리 한다.
				if (BCrypt.checkpw(loginPwd, password)) {
					result = true;
				}
			}
		}

		return result;


}
