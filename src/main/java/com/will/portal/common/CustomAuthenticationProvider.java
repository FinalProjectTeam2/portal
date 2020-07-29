package com.will.portal.common;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.will.portal.employee.model.EmployService;
import com.will.portal.employee.model.EmployeeVO;
import com.will.portal.professor.model.ProfessorService;
import com.will.portal.professor.model.ProfessorVO;
import com.will.portal.student.model.StudentService;
import com.will.portal.student.model.StudentVO;

public class CustomAuthenticationProvider implements AuthenticationProvider {

	private static final Logger logger = LoggerFactory.getLogger(CustomAuthenticationProvider.class);
	@Autowired
	private MemberService userDetailsService;

	@Autowired
	private EmployService employeeService;

	@Autowired
	private StudentService studentService;

	@Autowired
	private ProfessorService professorService;

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String username = (String) authentication.getPrincipal();
		String password = (String) authentication.getCredentials();
		logger.info("로그인 처리, 파라미터 authentication={}", authentication);
		logger.info("username={}, password={}", username, password);

		String num = username.substring(4, 5);
		EmployeeVO user = null;
		StudentVO stuVo = null;
		ProfessorVO proVo = null;

		char check;
		for (int i = 0; i < num.length(); i++) {
			check = num.charAt(i);
			if (check < 48 || check > 58) {
				// 해당 char값이 숫자가 아닐 경우
				throw new BadCredentialsException("잘못된 형식의 아이디입니다.");
			}

		}
		switch (Integer.parseInt(num)) {
		case 1:
			user = (EmployeeVO) userDetailsService.loadUserByUsername(username);
			if (!matchPassword(password, user.getPassword(), num, username)) {
				throw new BadCredentialsException("비밀번호가 틀렸습니다.");
			}

			if (!user.isEnabled()) {
				throw new BadCredentialsException("비밀번호가 틀렸습니다.");
			}
			return new UsernamePasswordAuthenticationToken(user, password, user.getAuthorities());

		case 2:
			proVo = (ProfessorVO) userDetailsService.loadUserByUsername(username);
			if (!matchPassword(password, proVo.getPassword(), num, username)) {
				throw new BadCredentialsException("비밀번호가 틀렸습니다.");
			}

			if (!proVo.isEnabled()) {
				throw new BadCredentialsException("비밀번호가 틀렸습니다.");
			}
			return new UsernamePasswordAuthenticationToken(proVo, password, proVo.getAuthorities());
		default:
			stuVo = (StudentVO) userDetailsService.loadUserByUsername(username);
			if (!matchPassword(password, stuVo.getPassword(), num, username)) {
				throw new BadCredentialsException("비밀번호가 틀렸습니다.");
			}

			if (!stuVo.isEnabled()) {
				throw new BadCredentialsException("비밀번호가 틀렸습니다.");
			}
			return new UsernamePasswordAuthenticationToken(stuVo, password, stuVo.getAuthorities());

		}
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return true;
	}

	private boolean matchPassword(String loginPwd, String password, String num, String username) {
		boolean result = false;
		if (num.equals("1")) {
			result = employeeService.loginCheckSec(loginPwd, password, username);

		} else if (num.equals("2")) {
			result = professorService.loginCheckSec(loginPwd, password, username);

		} else if (num.equals("3")) {
			result = studentService.loginCheck(loginPwd, password, username);

		}

		return result;
	}
}
