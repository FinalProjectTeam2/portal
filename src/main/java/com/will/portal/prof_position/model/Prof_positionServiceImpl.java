package com.will.portal.prof_position.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Prof_positionServiceImpl implements Prof_positionService{
	@Autowired Prof_positionDAO profPositionDao;

	@Override
	public List<Prof_positionVO> selectProfPosition() {
		return profPositionDao.selectProfPosition();
	}
}
