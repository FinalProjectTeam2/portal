package com.will.portal.bank.model;

import java.util.List;

public interface BankService {
	List<BankVO> selectAllBank();
	int updateAccount(BankVO bankVo);
}
