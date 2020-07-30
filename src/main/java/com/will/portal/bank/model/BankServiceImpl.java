package com.will.portal.bank.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.will.portal.account_info.model.Account_infoVO;

@Service
public class BankServiceImpl implements BankService{
	@Autowired
	private BankDAO bankDao;
	
	public List<BankVO> selectAllBank(){
		return bankDao.selectAllBank();
	}


	@Override
	public int updateAccount(Account_infoVO accInfoV) {
		return bankDao.updateAccount(accInfoV);
	}
}
