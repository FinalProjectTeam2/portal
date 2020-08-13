package com.will.portal.subj_eval.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.will.portal.registration.model.RegistrationVO;

@Service
public class Subj_evalServiceImpl implements Subj_evalService{

	@Autowired
	private Subj_evalDAO subjEvalDao;

	@Override
	public int insertSubjEval(Subj_evalVO evalVo) {
		return subjEvalDao.insertSubjEval(evalVo);
	}

	@Override
	public int updateEvalFlag(RegistrationVO regiVo) {
		return subjEvalDao.updateEvalFlag(regiVo);
	}

	@Override
	public SubjAvgVO selectAvgEval(String subCode) {
		return subjEvalDao.selectAvgEval(subCode);
	}

	@Override
	public List<AllSubjAvgVO> selectsubCodeByProfNo(String profNo) {
		return subjEvalDao.selectsubCodeByProfNo(profNo);
	}

	@Override
	public String selectEvalFlag(RegistrationVO regiVo) {
		return subjEvalDao.selectEvalFlag(regiVo);
	}

	@Override
	public Map<String, Object> selectProfNameBySubj(String subjCode) {
		return subjEvalDao.selectProfNameBySubj(subjCode);
	}
	
}
