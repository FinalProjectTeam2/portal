package com.will.portal.statistics.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.will.portal.common.ScoreChartSearchVO;

@Service
public class StatisticsServiceImpl implements StatisticsService{

	@Autowired
	private StatisticsDAO statisticsDao;

	@Override
	public List<Map<String, Object>> selectScoreMain() {
		return statisticsDao.selectScoreMain();
	}

	@Override
	public List<Map<String, Object>> selectBoardMain() {
		return statisticsDao.selectBoardMain();
	}

	@Override
	public List<Map<String, Object>> selectScoreAvg(ScoreChartSearchVO scoreChartSearchVo) {
		return statisticsDao.selectScoreAvg(scoreChartSearchVo);
	}
	

	@Override
	public List<Map<String, Object>> selectScoreMed(ScoreChartSearchVO scoreChartSearchVo) {
		return statisticsDao.selectScoreMed(scoreChartSearchVo);
	}

	@Override
	public List<String> selectChartSemester() {
		return statisticsDao.selectChartSemester();
	}

	@Override
	public List<Map<String, Object>> selectBoardChart(int time) {
		return statisticsDao.selectBoardChart(time);
	}

	@Override
	public List<Map<String, Object>> selectBoardChartReadCount(int time) {
		return statisticsDao.selectBoardChartReadCount(time);
	}
}
