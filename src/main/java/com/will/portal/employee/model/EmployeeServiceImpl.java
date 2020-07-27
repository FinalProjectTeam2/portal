package com.will.portal.employee.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.will.portal.official_info.model.Official_infoDAO;
import com.will.portal.official_info.model.Official_infoVO;

@Service
public class EmployeeServiceImpl implements EmployService {
	@Autowired private EmployeeDAO employeeDao;
	@Autowired private Official_infoDAO officialDao;

	@Transactional
	public int insertEmployee(EmployeeVO employeeVo, Official_infoVO officialVo, int sort) {

		int seq = employeeDao.selectSeq(sort);

		SimpleDateFormat format1 = new SimpleDateFormat("yyyy");
		Date time = new Date();

		String userNo = format1.format(time) + sort + String.format("%03d", Integer.parseInt(employeeVo.getDepCode()))
				+ String.format("%04d", seq);
		employeeVo.setEmpNo(userNo);
		employeeVo.setPwd("0000");

		int cnt = employeeDao.insertEmployee(employeeVo);

		int cnt2 = 0;
		if (cnt > 0) {

			officialVo.setOfficialNo(userNo);
			cnt2 = officialDao.insertOfficial(officialVo);
		}
		return cnt2;
	}

}
