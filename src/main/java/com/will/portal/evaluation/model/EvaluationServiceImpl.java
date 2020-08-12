package com.will.portal.evaluation.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.will.portal.student.model.StudentVO;

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

	@Override
	public int updateAllScore(List<EvaluationVO> list) {
		int cnt = 0;

		try {
			for (EvaluationVO vo : list) {
					cnt = evaluationDao.updateAllScore(vo);
			}

		}catch(RuntimeException e) {
			cnt = -1;
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return cnt;
	} 
	
	
	
}
