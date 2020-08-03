package com.will.portal.syllabus.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SyllabusServiceImpl implements SyllabusService {
	@Autowired
	private SyllabusDAO syllabusDao;

	@Override
	public int insertSyllabus(SyllabusVO vo) {
		return syllabusDao.insertSyllabus(vo);
	}
	
	
}
