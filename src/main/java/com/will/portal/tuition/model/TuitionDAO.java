package com.will.portal.tuition.model;

import java.util.List;

public interface TuitionDAO {
	List<TuitionStuVO> selectStu();
	List<TuitionVO> tuitionD();
}
