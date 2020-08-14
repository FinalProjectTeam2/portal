package com.will.portal.scholarship.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ScholarshipServiceImpl implements ScholarshipService {
	@Autowired ScholarshipDAO scholarshipDao;

	@Override
	public List<ScholarshipVO> selectAllScholarship() {
		return scholarshipDao.selectAllScholarship();
	}
	

}
