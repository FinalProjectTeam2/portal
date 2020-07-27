package com.will.portal.board.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.portal.category.model.CategoryListVO;

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
	
	
}
