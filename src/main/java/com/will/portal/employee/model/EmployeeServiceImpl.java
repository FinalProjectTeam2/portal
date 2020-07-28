package com.will.portal.employee.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.will.portal.common.model.CommonDAO;
import com.will.portal.official_info.model.Official_infoDAO;
import com.will.portal.official_info.model.Official_infoVO;

@Service
public class EmployeeServiceImpl implements EmployService {
	@Autowired private EmployeeDAO employeeDao;
	@Autowired private Official_infoDAO officialDao;
	@Autowired private CommonDAO commonDao;

	@Transactional
	public int insertEmployee(EmployeeVO employeeVo, Official_infoVO officialVo, int sort) {

		int seq = commonDao.selectSeq(sort);

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

	@Override
	public int loginCheck(String officicalNo, String pwd) {

		String dbPwd = employeeDao.selectPwd(officicalNo);
		int result = 0;
		if(dbPwd != null && !dbPwd.isEmpty() ) {
			if(pwd.equals(dbPwd)) {
				result = LOGIN_OK;
			}else {
				result = PWD_DISAGREE;
			}
		}else {
			result = ID_NONE;
		}

		return result;

	}

	@Override
	public EmployeeVO selectByEmpNo(String empNo) {
		return employeeDao.selectByEmpNo(empNo);
	}
}
