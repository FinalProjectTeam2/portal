package com.will.portal.bookmark.model;

import java.util.List;

public interface BookmarkDAO {
	int insertBookmark(BookmarkVO vo);
	List<BookmarkVO> selectByOffiNo(String officialNo);
	int updateBookmark(BookmarkVO vo);
	int deleteBookmark(int no);
}
