package com.will.portal.subj_eval.model;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.portal.registration.model.RegistrationVO;

@Repository
public class Subj_evalDAOMybatis implements Subj_evalDAO{
	@Autowired
	private SqlSessionTemplate sqlsession;

	private String namespace="config.mybatis.mapper.oracle.subject.";

	@Override
	public int insertSubjEval(Subj_evalVO evalVo) {
		return sqlsession.insert(namespace + "insertSubjEval", evalVo);
	}

	@Override
	public int updateEvalFlag(RegistrationVO regiVo) {
		return sqlsession.update(namespace + "updateEvalFlag", regiVo);
	}

	@Override
	public SubjAvgVO selectAvgEval(String subCode) {
		return sqlsession.selectOne(namespace +"selectAvgEval", subCode);
	}

	@Override
	public List<AllSubjAvgVO> selectsubCodeByProfNo(String profNo) {
		return sqlsession.selectList(namespace + "selectsubCodeByProfNo",profNo);
	}

	@Override
	public String selectEvalFlag(RegistrationVO regiVo) {
		return sqlsession.selectOne(namespace + "selectEvalFlag", regiVo);
	}

	@Override
	public Map<String, Object> selectProfNameBySubj(String subjCode) {
		return sqlsession.selectOne(namespace + "selectProfNameBySubj", subjCode);
	}

}
