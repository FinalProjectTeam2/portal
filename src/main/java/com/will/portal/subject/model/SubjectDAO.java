package com.will.portal.subject.model;

import java.util.List;

import com.will.portal.open_subj.model.Open_subjVO;
import com.will.portal.subj_type.model.Subj_typeVO;

public interface SubjectDAO {
	List<Subj_typeVO> selectType();
	int subjectSeq();
	int insertSubject(SubjectVO vo);
	int insertOpenSubj(Open_subjVO vo);
}
