package com.will.portal.account_info.model;

import java.util.List;

public interface Account_InfoService {
	int insertAccount(String officialNo);
	List<Account_infoVO> selectAllAccount();
}
