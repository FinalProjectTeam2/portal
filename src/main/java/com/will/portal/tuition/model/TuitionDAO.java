package com.will.portal.tuition.model;

import java.util.List;

public interface TuitionDAO {
	List<TuitionStuVO> selectStuView(String officicalNo);
	List<TuitionViewVO> selectTuitionView(String officicalNo);
	List<TuitionDetailVO> selectTuitionDView(String officicalNo);
}
