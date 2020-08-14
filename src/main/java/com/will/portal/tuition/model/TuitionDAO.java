package com.will.portal.tuition.model;

import java.util.Map;


public interface TuitionDAO {
	Map<String, Object> selectStuView(String officicalNo);
	Map<String, Object> selectTuitionView(String officicalNo);
	Map<String, Object> selectTuitionDView(String officicalNo);
}
