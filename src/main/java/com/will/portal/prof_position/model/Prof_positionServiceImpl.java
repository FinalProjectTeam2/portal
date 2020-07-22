package com.will.portal.prof_position.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Prof_positionServiceImpl implements Prof_positionService{
	@Autowired
	private Prof_positionDAO prof_positionDao;
}
