package com.will.portal.common.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommonServiceImpl implements CommonService{

	@Autowired CommonDAO commonDao;

	@Override
	public int selectSeq(int sort) {
		return commonDao.selectSeq(sort);
	}
}
