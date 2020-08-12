package com.will.portal.bookmark.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BookmarkDAOMybatis implements BookmarkDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private final String namespace = "config.mybatis.mapper.oracle.bookmark.";
	
	@Override
	public int insertBookmark(BookmarkVO vo) {
		return sqlSession.insert(namespace+"insertBookmark", vo);
	}

	@Override
	public List<BookmarkVO> selectByOffiNo(String officialNo) {
		return sqlSession.selectList(namespace+"selectByOffiNo", officialNo);
	}

	@Override
	public int updateBookmark(BookmarkVO vo) {
		return sqlSession.update(namespace+"updateBookmark", vo);
	}

	@Override
	public int deleteBookmark(int no) {
		return sqlSession.delete(namespace+"deleteBookmark", no);
	}

}
