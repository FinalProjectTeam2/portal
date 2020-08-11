package com.will.portal.official_info.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.will.portal.professor.model.ProfessorVO;
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

	@Override
	public int updateCodeP(ProfessorVO vo) {
		return infoDao.updateCodeP(vo);
	}

	@Override
	public String selectCodeP(String profNo) {
		return infoDao.selectCodeP(profNo);
	}

	@Override
	public int updateIdentStateP(String profNo) {
		return infoDao.updateIdentStateP(profNo);
	}

	@Override
	public int updateOfficialInfo(Official_infoVO offiVo) {
		return infoDao.updateOfficialInfo(offiVo);
	}

	@Override
	public int updateChangeDate(String profNo) {
		return infoDao.updateChangeDate(profNo);
	}

	@Override
	public int deleteOfficial(String officialNo) {
		return infoDao.deleteOfficial(officialNo);
	}


	@Override
	public int deleteMulti(List<Official_infoVO> offiList) {
		int cnt = 0;

		try {
			for (Official_infoVO offiVO : offiList) {
				if(offiVO.getOfficialNo()!=null) {
					cnt = infoDao.deleteOfficial(offiVO.getOfficialNo());
				}
			}

		}catch(RuntimeException e) {
			cnt = -1;
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return cnt;
	}
}
