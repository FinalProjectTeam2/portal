package com.will.portal.category.model;

import java.util.List;

import com.will.portal.board.model.BoardVO;

public class CategoryListVO {
	private CategoryVO categoryVo;
	private List<BoardVO> boardList;

	public CategoryVO getcategoryVo() {
		return categoryVo;
	}

	public void setcategoryVo(CategoryVO categoryVo) {
		this.categoryVo = categoryVo;
	}

	public List<BoardVO> getBoardList() {
		return boardList;
	}

	public void setBoardList(List<BoardVO> boardList) {
		this.boardList = boardList;
	}

	public CategoryListVO(CategoryVO categoryVo, List<BoardVO> boardList) {
		super();
		this.categoryVo = categoryVo;
		this.boardList = boardList;
	}

	public CategoryListVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "categoryVoListVO [categoryVo=" + categoryVo + ", boardList=" + boardList + "]";
	}

}
