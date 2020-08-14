package com.will.portal.tuition.model;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TuitionServiceImpl implements TuitionService {
	
	@Autowired private TuitionDAO tuitionDao;

	@Override
	public Map<String, Object> selectStuView(String officicalNo) {
		
		return tuitionDao.selectStuView(officicalNo);
	}




}
