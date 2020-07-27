package com.will.portal.student.model;

import com.will.portal.official_info.model.Official_infoVO;

public interface StudentService {

	int insertStudent(StudentVO studentVo, Official_infoVO officialVo, int sort);
}
