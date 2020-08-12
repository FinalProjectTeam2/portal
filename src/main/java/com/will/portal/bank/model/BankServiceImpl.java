package com.will.portal.bank.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.will.portal.account_info.model.Account_infoVO;
import com.will.portal.official_info.model.Official_infoVO;

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


	@Override
	public int deleteAccountInfo(String officialNo) {
		return bankDao.deleteAccountInfo(officialNo);
	}

	public int deleteMulti(List<Account_infoVO> accInfoVoList) {
		int cnt = 0;

		try {
			for (Account_infoVO accVo : accInfoVoList) {
				if(accVo.getOfficialNo()!=null) {
					cnt = bankDao.deleteAccountInfo(accVo.getOfficialNo());
				}
			}

		}catch(RuntimeException e) {
			cnt = -1;
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return cnt;
	}
}
