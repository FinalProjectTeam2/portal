package com.will.portal.bank.model;

import java.util.List;

import com.will.portal.account_info.model.Account_infoVO;

public interface BankDAO {
	List<BankVO> selectAllBank();
	int updateAccount(Account_infoVO accInfoV);
	int deleteAccountInfo(String officialNo);
	Account_infoVO selectAccByofficialNo(String officialNo);
}
