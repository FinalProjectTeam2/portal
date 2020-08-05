package com.will.portal.files.model;

import java.util.List;

public interface FilesDAO {
	int insertFiles(FilesVO vo);
	int selectCountByPostNo(int postNo);
	int upDownCount(int no);
	int deleteFile(int no);
	List<FilesVO> selectFileByPostNo(int postNo);
}
