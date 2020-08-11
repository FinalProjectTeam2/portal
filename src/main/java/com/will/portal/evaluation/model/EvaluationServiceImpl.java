package com.will.portal.evaluation.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EvaluationServiceImpl implements EvaluationService {
	@Autowired
	private EvaluationDAO evaluationDao;

	@Override
	public List<EvaluationAllVO> selectAllListforEval(String subCode) {
		return evaluationDao.selectAllListforEval(subCode);
	}

	@Override
	public List<Map<String, Object>> subjectByProfNo(String profNo) {
		return evaluationDao.subjectByProfNo(profNo);
	}

	@Override
	public int inputScore(EvaluationVO vo) {
		return evaluationDao.inputScore(vo);
	} 
	
	
	
}
