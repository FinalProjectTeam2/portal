package com.will.portal.subj_eval.model;

import java.util.List;
import java.util.Map;

import com.will.portal.registration.model.RegistrationVO;

public interface Subj_evalDAO {
	int insertSubjEval(Subj_evalVO evalVo);
	int updateEvalFlag(RegistrationVO regiVo);
	SubjAvgVO selectAvgEval(String subCode);
	List<AllSubjAvgVO> selectsubCodeByProfNo(String profNo);
	String selectEvalFlag(RegistrationVO regiVo);
	Map<String, Object> selectProfNameBySubj(String subjCode);
	List<Subj_evalVO> selectEvalBysubCode(String subCode);
	
}
