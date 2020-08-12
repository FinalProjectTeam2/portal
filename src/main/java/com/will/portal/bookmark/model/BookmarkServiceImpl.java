package com.will.portal.bookmark.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookmarkServiceImpl implements BookmarkService{
	@Autowired
	BookmarkDAO dao;

	@Override
	public int insertBookmark(BookmarkVO vo) {
		return dao.insertBookmark(vo);
	}

	@Override
	public List<BookmarkVO> selectByOffiNo(String officialNo) {
		return dao.selectByOffiNo(officialNo);
	}

	@Override
	public int updateBookmark(BookmarkVO vo) {
		return dao.updateBookmark(vo);
	}

	@Override
	public int deleteBookmark(int no) {
		return dao.deleteBookmark(no);
	}
	
	
}
