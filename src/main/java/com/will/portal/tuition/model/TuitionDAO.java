package com.will.portal.tuition.model;

import java.util.Map;

public interface TuitionDAO {
	Map<String, Object> selectStuView(String officicalNo);

}
