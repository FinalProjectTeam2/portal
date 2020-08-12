package com.will.portal.board.model;

import java.util.List;

import com.will.portal.category.model.CategoryListVO;
import com.will.portal.category.model.CategoryVO;

public interface BoardService {
	 List<CategoryListVO> selectCategoryList();
	 BoardVO selectBoardByBdCode(String bdCode);
	 List<BoardVO> selectBoardByCtCode(String ctCode);
	 List<BoardVO> selectBoardByCategoryInline(String bdCode);
	 int countByCateCode(String code);
	 int insertCate(CategoryVO vo);
}
