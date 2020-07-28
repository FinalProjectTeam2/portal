package com.will.portal.files.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FilesServiceImpl implements FilesService{
	
	@Autowired
	private FilesDAO filesDao;

	@Override
	public int insertFiles(FilesVO vo) {
		return filesDao.insertFiles(vo);
	}
	
}
