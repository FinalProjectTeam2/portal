package com.will.portal.subj_eval.model;

import java.util.List;
import java.util.Map;

import com.will.portal.registration.model.RegistrationVO;

public interface Subj_evalService {
	public int insertSubjEval(Subj_evalVO evalVo);
	public int updateEvalFlag(RegistrationVO regiVo);
	public SubjAvgVO selectAvgEval(String subCode);
	public List<AllSubjAvgVO> selectsubCodeByProfNo(String profNo);
	public String selectEvalFlag(RegistrationVO regiVo);
	public Map<String, Object> selectProfNameBySubj(String subjCode);
	public List<Subj_evalVO> selectEvalBysubCode(String subCode);
}
