package com.will.portal.tuition.model;

import java.util.List;

public interface TuitionDAO {
	List<TuitionAllVO> selectStu(TuitionAllVO AllVo);
}