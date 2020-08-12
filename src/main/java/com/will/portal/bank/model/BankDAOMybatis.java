package com.will.portal.bank.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.portal.account_info.model.Account_infoVO;

@Repository
public class BankDAOMybatis implements BankDAO {
	private String namespace = "config.mybatis.mapper.oracle.bank.";
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Override
	public List<BankVO> selectAllBank() {
		return sqlSession.selectList(namespace + "selectAllBank");
	}
	@Override
	public int updateAccount(Account_infoVO accInfoVo)  {
		return sqlSession.update(namespace +"updateAccount",accInfoVo);
	}
	@Override
	public int deleteAccountInfo(String officialNo) {
		return sqlSession.delete(namespace +"deleteAccountInfo", officialNo);
	}
	
	
}
