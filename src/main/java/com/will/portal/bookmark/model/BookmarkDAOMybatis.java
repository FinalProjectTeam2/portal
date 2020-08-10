package com.will.portal.bookmark.model;

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

}
