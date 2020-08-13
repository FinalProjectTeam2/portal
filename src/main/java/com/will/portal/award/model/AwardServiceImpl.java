package com.will.portal.award.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AwardServiceImpl implements AwardService {
	@Autowired private AwardDAO awardDao;

	@Override
	public List<AwardVO> selectAllaward() {
		return awardDao.selectAllaward();
	}
	
}
