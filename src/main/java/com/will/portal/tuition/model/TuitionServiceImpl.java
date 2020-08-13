package com.will.portal.tuition.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TuitionServiceImpl implements TuitionService {
	
	@Autowired private TuitionDAO tuitionDao;

	@Override
	public List<TuitionStuVO> selectStu(String officialNo) {

		return tuitionDao.selectStu(officialNo);
	}

	@Override
	public List<TuitionVO> selectTuition(String officialNo) {
		
		return tuitionDao.selectTuition(officialNo);
	}


}
