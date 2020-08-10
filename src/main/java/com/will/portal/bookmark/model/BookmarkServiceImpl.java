package com.will.portal.bookmark.model;

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
	
	
}
