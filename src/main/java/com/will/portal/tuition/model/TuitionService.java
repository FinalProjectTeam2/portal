package com.will.portal.tuition.model;

import java.util.List;

public interface TuitionService {
	List<TuitionStuVO> selectStuView(String officicalNo);
	List<TuitionViewVO> selectTuitionView(String officicalNo);
	List<TuitionDetailVO> selectTuitionDView(String officicalNo);
}
