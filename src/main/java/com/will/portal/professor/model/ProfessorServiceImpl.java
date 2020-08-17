package com.will.portal.professor.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.will.portal.account_info.model.Account_InfoDAO;
import com.will.portal.common.ProfSearchVO;
import com.will.portal.common.model.CommonDAO;
import com.will.portal.official_info.model.Official_infoDAO;
import com.will.portal.official_info.model.Official_infoVO;
import com.will.portal.phoneBook.model.PhoneBookVO;
import com.will.portal.regi_timetable.model.Regi_timetableVO;
import com.will.portal.subj_time.model.Subj_timeVO;
import com.will.portal.subject.model.SubjectAllVO;

@Service
public class ProfessorServiceImpl implements ProfessorService {

	@Autowired
	private ProfessorDAO professorDao;

	@Autowired
	private Official_infoDAO officialDao;
	@Autowired
	private CommonDAO commonDao;
	@Autowired private Account_InfoDAO accountInfoDao;


	@Transactional
	public int insertProfessor(ProfessorVO professorVo, Official_infoVO officialVo, int sort) {

		int seq = commonDao.selectSeq(sort);

		SimpleDateFormat format1 = new SimpleDateFormat("yyyy");
		Date time = new Date();

		String userNo = format1.format(time) + sort + String.format("%03d", professorVo.getDepNo())
				+ String.format("%04d", seq);
		professorVo.setProfNo(userNo);
		professorVo.setPwd(officialVo.getSsn().substring(0, 6));

		int cnt = professorDao.insertProfessor(professorVo);

		int cnt2 = 0;
		int ac=accountInfoDao.insertAccount(userNo);
		if (cnt > 0 && ac>0) {

			officialVo.setOfficialNo(userNo);
			cnt2 = officialDao.insertOfficial(officialVo);
		}
		return cnt2;
	}

	@Override
	public int loginCheck(String officicalNo, String pwd) {

		// 최초 로그인시 비밀번호가 생년월일과 같기때문에 생년월일부터 받아온다
		String birthDay = professorDao.selectSsn(officicalNo).substring(0, 6);
		String dbPwd = professorDao.selectPwd(officicalNo);
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
	public ProfessorVO selectByProfNo(String profNo) {
		return professorDao.selectByProfNo(profNo);
	}

	@Override
	public boolean loginCheckSec(String loginPwd, String password, String officicalNo) {
		// 최초 로그인시 비밀번호가 생년월일과 같기때문에 생년월일부터 받아온다
		String birthDay = professorDao.selectSsn(officicalNo).substring(0, 6);
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

	public List<SubjectAllVO> loadByProfNo(String profNo) {
		return professorDao.loadByProfNo(profNo);
	}

	@Override
	public List<Subj_timeVO> timeByProfNo(String profNo) {
		List<String> list = professorDao.codeByProfNo(profNo);
		return professorDao.timeByCode(list);
	}

	@Override
	public int insertSubjTime(Subj_timeVO vo) {
		return professorDao.insertSubjTime(vo);
	}

	@Override
	public List<Map<String, Object>> classroomByDepNo(String depNo) {
		return professorDao.classroomByDepNo(depNo);
	}

	@Override
	public Map<String, Object> selectViewByProfNo(String profNo) {
		return professorDao.selectViewByProfNo(profNo);
	}
	@Override
	public List<Map<String, Object>> selectProfessorView(ProfSearchVO profSearchVo) {
		return professorDao.selectProfessorView(profSearchVo);
	}

	@Override
	public int getTotalRecord(ProfSearchVO profSearchVo) {
		return professorDao.getTotalRecord(profSearchVo);
	}

	@Override

	public int countByOpenCode(String openSubCode) {
		return professorDao.countByOpenCode(openSubCode);
	}

	@Override
	public String selectShortName(String timetableCode) {
		return professorDao.selectShortName(timetableCode);
	}

	@Override
	public int insertTimetable(Regi_timetableVO vo) {
		return professorDao.insertTimetable(vo);
	}

	@Override
	public int updateTimetable(Regi_timetableVO vo) {
		return professorDao.updateTimetable(vo);
	}


	public int mutiUpdatePosition(List<ProfessorVO> list, int positionNo) {
		int cnt = 0;
		try {
			for (ProfessorVO professorVO : list) {
				if(professorVO.getProfNo() != null) {
					professorVO.setPositionNo(positionNo);
					cnt = professorDao.updatePosition(professorVO);
				}
			}
		}catch (RuntimeException e) {
			cnt = -1;
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return cnt;
	}

	@Override
	public int deleteProfessor(String profNo) {
		return professorDao.deleteProfessor(profNo);
	}

	@Override
	@Transactional
	public int multiDelete(List<ProfessorVO> list) {
		int cnt = 0;
		for (ProfessorVO professorVO : list) {
			if(professorVO.getProfNo() != null) {
				cnt = professorDao.deleteProfessor(professorVO.getProfNo());
			}
		}

		return cnt;
	}

	@Override
	public List<PhoneBookVO> phoneBook(String subCode) {
		return professorDao.phoneBook(subCode);
	}

	@Override
	public int updateProfessor(ProfessorVO profVo) {
		return professorDao.updateProfessor(profVo);
	}

	
	


}
