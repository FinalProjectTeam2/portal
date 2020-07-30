package com.will.portal.bank.model;

import java.util.List;

public interface BankDAO {
	List<BankVO> selectAllBank();
	int updateAccount(BankVO bankVo);
	
}
