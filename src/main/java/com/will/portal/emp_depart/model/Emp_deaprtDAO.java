package com.will.portal.emp_depart.model;

import java.util.List;

public interface Emp_deaprtDAO {
	public List<Emp_departVO> selectEmpDepart();
	Emp_departVO selectEmpDepartByCode(String Code);
}
