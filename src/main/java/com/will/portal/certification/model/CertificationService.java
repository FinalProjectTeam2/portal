package com.will.portal.certification.model;

import java.util.List;

public interface CertificationService {
	int getSeq();
	int insertCert(CertificationVO vo);
	List<CertificationVO> selectByStuNo(String stuNo);
	CertificationVO selectByNo(String no);
	int updateIsPrint(String no);
}
