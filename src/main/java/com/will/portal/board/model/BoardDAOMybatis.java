package com.will.portal.board.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.portal.category.model.CategoryListVO;
import com.will.portal.category.model.CategoryVO;

@Repository
public class BoardDAOMybatis implements BoardDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.board.";

	@Override
	public List<CategoryListVO> selectCategoryList() {
		return sqlSession.selectList(namespace+"selectCategoryList");
	}

	@Override
	public BoardVO selectBoardByBdCode(String bdCode) {
		return sqlSession.selectOne(namespace + "selectBoardByBdCode", bdCode);
	}

	@Override
	public List<BoardVO> selectBoardByCategoryInline(String bdCode) {
		return sqlSession.selectList(namespace+"selectBoardByCategoryInline", bdCode);
	}

	@Override
	public List<BoardVO> selectBoardByCtCode(String ctCode) {
		return sqlSession.selectList(namespace+"selectBoardByCtCode", ctCode);
	}

	@Override
	public int countByCateCode(String code) {
		return sqlSession.selectOne(namespace+"countByCateCode", code);
	}

	@Override
	public int insertCate(CategoryVO vo) {
		return sqlSession.insert(namespace+"insertCate", vo);
	}
	
	
}
