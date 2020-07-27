package com.will.portal.professor.model;

import com.will.portal.official_info.model.Official_infoVO;

public interface ProfessorService {

	int insertProfessor(ProfessorVO profVo, Official_infoVO officialVo, int sort);
}
