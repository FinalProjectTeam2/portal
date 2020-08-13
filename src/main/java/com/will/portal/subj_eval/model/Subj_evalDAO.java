package com.will.portal.subj_eval.model;

import java.util.List;

import com.will.portal.registration.model.RegistrationVO;

public interface Subj_evalDAO {
	int insertSubjEval(Subj_evalVO evalVo);
	int updateEvalFlag(RegistrationVO regiVo);
	SubjAvgVO selectAvgEval(String subCode);
	List<AllSubjAvgVO> selectsubCodeByProfNo(String profNo);
}
