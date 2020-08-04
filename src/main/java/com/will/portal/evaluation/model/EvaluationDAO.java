package com.will.portal.evaluation.model;

import java.util.List;
import java.util.Map;

public interface EvaluationDAO {
	List<EvaluationAllVO> selectAllListforEval(String subCode);
	List<Map<String, Object>> subjectByProfNo(String profNo);
}
