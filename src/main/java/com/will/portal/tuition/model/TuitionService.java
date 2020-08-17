package com.will.portal.tuition.model;

import java.util.List;

public interface TuitionService {
	List<TuitionStuVO> selectStuView(String officicalNo);
	List<TuitionViewVO> selectTuitionView(String officicalNo);
	List<TuitionDetailVO> selectTuitionDView(String officicalNo);
	
	int selectByNo(int no);
	
	int insertTuition(TuitionDetailVO dVo);
	int updateTuition(TuitionDetailVO dVo);
	int deleteTuition(String officicalNo);
}
