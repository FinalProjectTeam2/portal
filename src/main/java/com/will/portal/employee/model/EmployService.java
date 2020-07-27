package com.will.portal.employee.model;

import com.will.portal.official_info.model.Official_infoVO;

public interface EmployService {

	int insertEmployee(EmployeeVO employeeVo, Official_infoVO officialVo, int sort);
}
