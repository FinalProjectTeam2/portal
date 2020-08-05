package com.will.portal.files.model;

import java.util.List;

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

	@Override
	public int selectCountByPostNo(int postNo) {
		return filesDao.selectCountByPostNo(postNo);
	}

	@Override
	public int upDownCount(int no) {
		return filesDao.upDownCount(no);
	}

	@Override
	public int deleteFile(int no) {
		return filesDao.deleteFile(no);
	}

	@Override
	public List<FilesVO> selectFileByPostNo(int postNo) {
		return filesDao.selectFileByPostNo(postNo);
	}
	
}
