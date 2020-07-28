package com.will.portal.board.model;

import java.util.List;

import com.will.portal.category.model.CategoryListVO;

public interface BoardService {
	 List<CategoryListVO> selectCategoryList();
	 BoardVO selectBoardByBdCode(String bdCode);
	 List<BoardVO> selectBoardByCategoryInline(String bdCode);
	 
}
