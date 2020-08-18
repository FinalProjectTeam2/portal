package com.will.portal.scholarship.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.will.portal.common.SearchVO;

@Service
public class ScholarshipServiceImpl implements ScholarshipService {
	@Autowired ScholarshipDAO scholarshipDao;

	@Override
	public List<ScholarshipAllVO> selectAllScholarship(String officicalNo) {
		return scholarshipDao.selectAllScholarship(officicalNo);
	}

	@Override
	public int insertscholarship(ScholarshipAllVO vo) {
		return scholarshipDao.insertscholarship(vo);
	}

	@Override
	public int updatescholarship(ScholarshipAllVO vo) {
		return scholarshipDao.updatescholarship(vo);
	}

	@Override
	public List<ScholarshipAllVO> selectAll(SearchVO searchVo) {
		return scholarshipDao.selectAll(searchVo);
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return scholarshipDao.selectTotalRecord(searchVo);
	}

	@Override
	public ScholarshipAllVO selectByNo(int no) {
		return scholarshipDao.selectByNo(no);
	}

	@Override
	public int deleteScholarship(int no) {
		return scholarshipDao.deleteScholarship(no);
	}


}
