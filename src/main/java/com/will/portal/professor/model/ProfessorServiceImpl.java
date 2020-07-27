package com.will.portal.professor.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.will.portal.common.model.CommonDAO;
import com.will.portal.official_info.model.Official_infoDAO;
import com.will.portal.official_info.model.Official_infoVO;

@Service
public class ProfessorServiceImpl implements ProfessorService{
	@Autowired
	private ProfessorDAO professorDao;
	
	@Autowired private Official_infoDAO officialDao;
	@Autowired private CommonDAO commonDao;

	@Transactional
	public int insertProfessor(ProfessorVO professorVo, Official_infoVO officialVo, int sort) {

		int seq = commonDao.selectSeq(sort);

		SimpleDateFormat format1 = new SimpleDateFormat("yyyy");
		Date time = new Date();

		String userNo = format1.format(time) + sort + String.format("%03d", professorVo.getDepNo())
				+ String.format("%04d", seq);
		professorVo.setProfNo(userNo);
		professorVo.setPwd("0000");

		int cnt = professorDao.insertProfessor(professorVo);

		int cnt2 = 0;
		if (cnt > 0) {

			officialVo.setOfficialNo(userNo);
			cnt2 = officialDao.insertOfficial(officialVo);
		}
		return cnt2;
	}
}
