package com.will.portal.subject.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.will.portal.open_subj.model.Open_subjVO;
import com.will.portal.student.model.StudentVO;
import com.will.portal.subj_type.model.Subj_typeVO;

@Service
public class SubjectServiceImpl implements SubjectService{
	@Autowired
	private SubjectDAO subjectDao;

	@Override
	public List<Subj_typeVO> selectType() {
		return subjectDao.selectType();
	}

	@Override
	public int subjectSeq() {
		return subjectDao.subjectSeq();
	}

	@Override
	public int insertSubject(SubjectVO vo) {
		return subjectDao.insertSubject(vo);
	}

	@Override
	public int insertOpenSubj(Open_subjVO vo) {
		return subjectDao.insertOpenSubj(vo);
	}

	@Override
	public int updateMultiCloseDate(List<Open_subjVO> openSubjList) {
		int cnt = 0;
		
		for (Open_subjVO open_subjVO : openSubjList) {
			if(open_subjVO.getOpenSubCode()!=null) {
				cnt = subjectDao.updateCloseDate(open_subjVO.getOpenSubCode());
			}
		}
		
		return cnt;
	}

	
	
	
}
