package com.will.portal.files.model;

public interface FilesService {
	int insertFiles(FilesVO vo);
	int selectCountByPostNo(int postNo);
	int upDownCount(int no);
}
