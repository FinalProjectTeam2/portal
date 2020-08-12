package com.will.portal.board.model;

import java.util.List;

import com.will.portal.category.model.CategoryListVO;
import com.will.portal.category.model.CategoryVO;

public interface BoardDAO {
	 List<CategoryListVO> selectCategoryList();
	 BoardVO selectBoardByBdCode(String bdCode);
	 List<BoardVO> selectBoardByCtCode(String ctCode);
	 List<BoardVO> selectBoardByCategoryInline(String bdCode);
	 int countByCateCode(String code);
	 int countByBdCode(String code);
	 int insertCate(CategoryVO vo);
	 int updateCate(CategoryVO vo);
	 int deleteCate(String ctCode);
	 CategoryVO selectCateByCode(String code);
	 int insertBoard(BoardVO vo);
	 int updateBoard(BoardVO vo);
	 int deleteBoard(String bdCode);
}
