package com.will.portal.tuition.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TuitionServiceImpl implements TuitionService {
	
	@Autowired private TuitionDAO tuitionDao;

	@Override
	public List<TuitionStuVO> selectStuView(String officicalNo) {
		return tuitionDao.selectStuView(officicalNo);
	}

	@Override
	public List<TuitionViewVO> selectTuitionView(String officicalNo) {
		return tuitionDao.selectTuitionView(officicalNo);
	}

	@Override
	public List<TuitionDetailVO> selectTuitionDView(String officicalNo) {
		return tuitionDao.selectTuitionDView(officicalNo);
	}

	@Override
	public int updateTuition(TuitionDetailVO dVo) {
		return tuitionDao.updateTuition(dVo);
	}

	@Override
	public int deleteTuition(String officicalNo) {
		return tuitionDao.deleteTuition(officicalNo);
	}

	@Override
	public TuitionDetailVO selectByNo(int no) {
		return tuitionDao.selectByNo(no);
	}

	@Override
	public int insertTuition(TuitionDetailVO vo) {
		return tuitionDao.insertTuition(vo);
	}




}
