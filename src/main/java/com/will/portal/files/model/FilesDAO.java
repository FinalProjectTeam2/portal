package com.will.portal.files.model;

public interface FilesDAO {
	int insertFiles(FilesVO vo);
	int selectCountByPostNo(int postNo);
}