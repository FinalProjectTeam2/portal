package com.will.portal.account_info.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Account_InfoServiceImpl implements Account_InfoService{

	@Autowired Account_InfoDAO accountInfoDao;

	@Override
	public int insertAccount(String officialNo) {
		return accountInfoDao.insertAccount(officialNo);
	}
	
	
}
