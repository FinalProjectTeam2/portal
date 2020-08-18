package com.will.portal.statistics.model;

import java.util.List;
import java.util.Map;

public interface StatisticsDAO {

	List<Map<String, Object>> selectScoreMain();
	List<Map<String, Object>> selectBoardMain();
}
