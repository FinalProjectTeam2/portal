package com.will.portal.bank.model;

import java.util.List;

import com.will.portal.account_info.model.Account_infoVO;
import com.will.portal.official_info.model.Official_infoVO;

public interface BankService {
	List<BankVO> selectAllBank();
	int updateAccount(Account_infoVO accInfoV);
	public int deleteAccountInfo(String officialNo);
	public int deleteMulti(List<Account_infoVO> accInfoVoList);
}
