package com.will.portal.tuition.model;

import java.util.List;

public interface TuitionService {
	List<TuitionStuVO> selectStu(String officialNo);
	List<TuitionVO> tuitionD();
}
