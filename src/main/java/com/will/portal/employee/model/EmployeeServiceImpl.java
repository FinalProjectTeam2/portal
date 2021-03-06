package com.will.portal.employee.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.will.portal.account_info.model.Account_InfoDAO;
import com.will.portal.common.EmployeeSearchVO;
import com.will.portal.common.model.CommonDAO;
import com.will.portal.official_info.model.Official_infoDAO;
import com.will.portal.official_info.model.Official_infoVO;

@Service
public class EmployeeServiceImpl implements EmployService {
	@Autowired private EmployeeDAO employeeDao;
	@Autowired private Official_infoDAO officialDao;
	@Autowired private CommonDAO commonDao;
	@Autowired private Account_InfoDAO accountInfoDao;

	@Transactional
	public int insertEmployee(EmployeeVO employeeVo, Official_infoVO officialVo, int sort) {

		int seq = commonDao.selectSeq(sort);

		SimpleDateFormat format1 = new SimpleDateFormat("yyyy");
		Date time = new Date();

		String userNo = format1.format(time) + sort + String.format("%03d", Integer.parseInt(employeeVo.getDepCode()))
				+ String.format("%04d", seq);
		employeeVo.setEmpNo(userNo);
		employeeVo.setPwd(officialVo.getSsn().substring(0,6));

		int cnt = employeeDao.insertEmployee(employeeVo);

		int ac=accountInfoDao.insertAccount(userNo);
		int cnt2 = 0;
		if (cnt > 0 && ac>0) {

			officialVo.setOfficialNo(userNo);
			cnt2 = officialDao.insertOfficial(officialVo);
		}
		return cnt2;
	}

	@Override
	public int loginCheck(String officicalNo, String pwd) {

		//최초 로그인시 비밀번호가 생년월일과 같기때문에 생년월일부터 받아온다
		String birthDay = employeeDao.selectSsn(officicalNo).substring(0, 6) ;
		String dbPwd = employeeDao.selectPwd(officicalNo);
		int result = 0;
		if(dbPwd != null && !dbPwd.isEmpty() ) {
			//최초로그인은 생년월일이 패스워드기 때문에 pdPwd말고 birthDay로 로그인체크
			//모든 패스워드 암호화할거기 때문에
			if(dbPwd.equals(birthDay)) {
				if(pwd.equals(dbPwd)) {
					result = LOGIN_OK;
				}else {
					result = PWD_DISAGREE;
				}
			}else {
				//비번 변경 후에는 암호화된 dbPwd와 비교해서 로그인 처리 한다.
				if(BCrypt.checkpw(pwd, dbPwd)){
					result = LOGIN_OK;
				}else if(!BCrypt.checkpw(pwd, dbPwd)){
					result = PWD_DISAGREE;
				}
			}
		}else {
			result = ID_NONE;
		}

		return result;

	}

	public boolean loginCheckSec(String loginPwd, String password, String officialNo) {

		boolean result = false;

		String birthDay = employeeDao.selectSsn(officialNo).substring(0, 6) ;
		if(password != null && !password.isEmpty() ) {
			//최초로그인은 생년월일이 패스워드기 때문에 pdPwd말고 birthDay로 로그인체크
			//모든 패스워드 암호화할거기 때문에
			if(password.equals(birthDay)) {
				if(loginPwd.equals(password)) {
					result = true;
				}
			}else {
				//비번 변경 후에는 암호화된 dbPwd와 비교해서 로그인 처리 한다.
				if(BCrypt.checkpw(loginPwd, password)){
					result = true;
				}
			}
		}

		return result;
	}

	@Override
	public EmployeeVO selectByEmpNo(String empNo) {
		return employeeDao.selectByEmpNo(empNo);
	}

	@Override
	public Map<String, Object> selectViewByEmpNo(String officialNo) {
		return employeeDao.selectViewByEmpNo(officialNo);
	}

	@Override
	public List<Map<String, Object>> selectEmployeeView(EmployeeSearchVO empSearchVo) {
		return employeeDao.selectEmployeeView(empSearchVo);
	}

	@Override
	public int getTotalRecord(EmployeeSearchVO empSearchVo) {
		return employeeDao.getTotalRecord(empSearchVo);
	}

	@Override
	public int updatePosition(EmployeeVO empVo) {
		return employeeDao.updatePosition(empVo);
	}

	@Override
	public int deleteEmployee(String empNo) {
		return employeeDao.deleteEmployee(empNo);
	}

	@Override
	public int multiUpdatePosition(List<EmployeeVO> list, String positionCode) {
		int cnt=0;
		try {
			for(EmployeeVO vo : list) {
				if(vo.getEmpNo() !=null) {
					vo.setPositionCode(positionCode);
					cnt=employeeDao.updatePosition(vo);
				}
			}
		} catch (RuntimeException e) {
			cnt=-1;
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}

		return cnt;
	}

	@Override
	public int multiDelete(List<EmployeeVO> list) {
		int cnt=0;
		for(EmployeeVO vo : list) {
			if(vo.getEmpNo()!=null) {
				cnt=employeeDao.deleteEmployee(vo.getEmpNo());
			}
		}

		return cnt;
	}

	@Override

	public List<EmployeeVO> selectListByName(String name) {
		return employeeDao.selectListByName(name);
	}
@Override
	public int updateAuthcode(EmployeeVO empvo) {
		return employeeDao.updateAuthcode(empvo);

	}
}
