package com.will.portal.board.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.will.portal.category.model.CategoryListVO;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDAO boardDao;
	
	 public List<CategoryListVO> selectCategoryList(){
		return boardDao.selectCategoryList(); 
	 }

	@Override
	public BoardVO selectBoardByBdCode(String bdCode) {
		return boardDao.selectBoardByBdCode(bdCode);
	}
}
