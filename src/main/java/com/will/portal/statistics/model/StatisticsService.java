package com.will.portal.statistics.model;

import java.util.List;
import java.util.Map;

import com.will.portal.common.ScoreChartSearchVO;

public interface StatisticsService {

	List<Map<String, Object>> selectScoreMain();
	List<Map<String, Object>> selectBoardMain();
	List<Map<String, Object>> selectScoreAvg(ScoreChartSearchVO scoreChartSearchVo);
	List<Map<String, Object>> selectScoreMed(ScoreChartSearchVO scoreChartSearchVo);
	List<String> selectChartSemester();
}
