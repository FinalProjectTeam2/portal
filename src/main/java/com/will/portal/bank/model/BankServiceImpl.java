package com.will.portal.bank.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BankServiceImpl implements BankService{
	@Autowired
	private BankDAO bankDao;
	
	public List<BankVO> selectAllBank(){
		return bankDao.selectAllBank();
	}

	@Override
	public int updateAccount(BankVO bankVo) {
		return bankDao.updateAccount(bankVo);
	}
}
