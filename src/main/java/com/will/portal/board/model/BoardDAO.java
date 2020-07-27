package com.will.portal.board.model;

import java.util.List;

import com.will.portal.category.model.CategoryListVO;

public interface BoardDAO {
	 List<CategoryListVO> selectCategoryList();
	 BoardVO selectBoardByBdCode(String bdCode);
}
