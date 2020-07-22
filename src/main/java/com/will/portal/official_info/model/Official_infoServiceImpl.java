package com.will.portal.official_info.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Official_infoServiceImpl implements Official_infoService{
	@Autowired
	private Official_infoDAO infoDao;

	@Override
	public Official_infoVO selectByNo(String officialNo) {
		return infoDao.selectByNo(officialNo);
	}

	
	
	
	
}
