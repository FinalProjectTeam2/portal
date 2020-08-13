package com.will.portal.board.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.will.portal.category.model.CategoryListVO;
import com.will.portal.category.model.CategoryVO;

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

	@Override
	public List<BoardVO> selectBoardByCategoryInline(String bdCode) {
		return boardDao.selectBoardByCategoryInline(bdCode);
	}

	@Override
	public List<BoardVO> selectBoardByCtCode(String ctCode) {
		return boardDao.selectBoardByCtCode(ctCode);
	}

	@Override
	public int countByCateCode(String code) {
		return boardDao.countByCateCode(code);
	}
	@Override
	public int countByBdCode(String code) {
		return boardDao.countByBdCode(code);
	}

	@Override
	public int insertCate(CategoryVO vo) {
		return boardDao.insertCate(vo);
	}
	@Override
	public int updateCate(CategoryVO vo) {
		return boardDao.updateCate(vo);
	}

	@Override
	public CategoryVO selectCateByCode(String code) {
		return boardDao.selectCateByCode(code);
	}

	@Override
	public int deleteCate(String ctCode) {
		return boardDao.deleteCate(ctCode);
	}
	
	@Override
	public int insertBoard(BoardVO vo) {
		return boardDao.insertBoard(vo);
	}
	
	@Override
	public int updateBoard(BoardVO vo) {
		return boardDao.updateBoard(vo);
	}

	@Override
	public int deleteBoard(String bdCode) {
		return boardDao.deleteBoard(bdCode);
	}
}
