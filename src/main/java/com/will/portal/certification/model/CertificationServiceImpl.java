package com.will.portal.certification.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CertificationServiceImpl implements CertificationService{
	@Autowired
	private CertificationDAO certDao;

	@Override
	public int getSeq() {
		return certDao.getSeq();
	}

	@Override
	public int insertCert(CertificationVO vo) {
		return certDao.insertCert(vo);
	}

	@Override
	public List<CertificationVO> selectByStuNo(String stuNo) {
		return certDao.selectByStuNo(stuNo);
	}

	@Override
	public CertificationVO selectByNo(String no) {
		return certDao.selectByNo(no);
	}

	@Override
	public int updateIsPrint(String no) {
		return certDao.updateIsPrint(no);
	}
	
	

}
