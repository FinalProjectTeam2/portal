package com.will.portal.tuition.model;

import java.util.List;

public interface TuitionDAO {
	List<TuitionStuVO> selectStuView(String officicalNo);
	List<TuitionViewVO> selectTuitionView(String officicalNo);
	List<TuitionDetailVO> selectTuitionDView(String officicalNo);
	
	TuitionDetailVO selectByNo(int no);
	
	int insertTuition(TuitionDetailVO vo);
	int updateTuition(TuitionDetailVO dVo);
	int deleteTuition(String officicalNo);
}
