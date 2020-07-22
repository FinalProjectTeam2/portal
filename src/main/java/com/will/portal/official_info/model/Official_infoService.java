package com.will.portal.official_info.model;

import com.will.portal.professor.model.ProfessorVO;
import com.will.portal.student.model.StudentVO;

public interface Official_infoService {
	Official_infoVO selectByNo(String officialNo);
}
