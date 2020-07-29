package com.will.portal.common;

import java.security.Principal;

import javax.servlet.http.Cookie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.will.portal.employee.model.EmployService;
import com.will.portal.employee.model.EmployeeDetails;
import com.will.portal.employee.model.EmployeeVO;
import com.will.portal.professor.model.ProfessorDetails;
import com.will.portal.professor.model.ProfessorService;
import com.will.portal.professor.model.ProfessorVO;
import com.will.portal.student.model.StudentDetails;
import com.will.portal.student.model.StudentService;
import com.will.portal.student.model.StudentVO;

public class CustomAuthenticationProvider implements AuthenticationProvider {

	@Autowired
	private MemberService userDetailsService;
	
	@Autowired
	private EmployService employeeService;
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private ProfessorService professorService;
	
	@SuppressWarnings("unchecked")
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String username = (String) authentication.getPrincipal();
        String password = (String) authentication.getCredentials();
        
        String num = username.substring(4,5);
        EmployeeDetails user = null;
        StudentDetails stuVo = null;
		ProfessorDetails proVo = null;
        switch (Integer.parseInt(num)) {
		case 1:
			user = (EmployeeDetails)userDetailsService.loadUserByUsername(username);
			if(!matchPassword(password, user.getPassword(),num)) {
	            throw new BadCredentialsException(username);
	        }
	 
	        if(!user.isEnabled()) {
	            throw new BadCredentialsException(username);
	        }
			break;
		case 2:
			user = (EmployeeDetails)userDetailsService.loadUserByUsername(username);
			if(!matchPassword(password, user.getPassword(),num)) {
	            throw new BadCredentialsException(username);
	        }
	 
	        if(!user.isEnabled()) {
	            throw new BadCredentialsException(username);
	        }
			break;
		case 3:
			user = (EmployeeDetails)userDetailsService.loadUserByUsername(username);
			if(!matchPassword(password, user.getPassword(),num)) {
	            throw new BadCredentialsException(username);
	        }
	 
	        if(!user.isEnabled()) {
	            throw new BadCredentialsException(username);
	        }
			break;
		default:
			
		}
       
        
        return new UsernamePasswordAuthenticationToken(username, password, user.getAuthorities());
		
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return true;
	}

	private boolean matchPassword(String loginPwd, String password, String num) {
		if(num.equals("1")) {
			type="admin";
			result= employeeService.loginCheck(officialNo,pwdd);
			
			if(result == EmployService.LOGIN_OK) {
				if(saveNo != null ) {
					Cookie cookie = new Cookie("ck_officialNo", officialNo);
					cookie.setMaxAge(1000*24*24*60);
					cookie.setPath("/");
					response.addCookie(cookie);
				}else {
					Cookie cookie2 = new Cookie("ck_officialNo", officialNo);
					cookie2.setMaxAge(0);//기존 쿠키 삭제
					cookie2.setPath("/");
					response.addCookie(cookie2);
				}
				
			}else if(result == EmployService.PWD_DISAGREE) {
				msg = "비밀번호가 잘못되었습니다";
			}else if(result == EmployService.ID_NONE) {
				msg = "존재하지 않는 아이디입니다";
			}
			
		}else if(num.equals("2")) {
			type="professor";
			result= professorService.loginCheck(officialNo,pwdd);
			
			if(result == ProfessorService.LOGIN_OK) {
				msg ="professor";
				ProfessorVO profVO = professorService.selectByProfNo(officialNo);
				request.getSession().setAttribute("officialNo", officialNo);
				request.getSession().setAttribute("name", profVO.getProfName());
				request.getSession().setAttribute("type", type);
				request.getSession().setAttribute("identState", profVO.getIdentityState());
				
				if(profVO.getIdentityState().equals("N")) {
					msg="N";
				}
				
				
				if(saveNo != null ) {
					Cookie cookie = new Cookie("ck_officialNo", officialNo);
					cookie.setMaxAge(1000*24*24*60);
					cookie.setPath("/");
					response.addCookie(cookie);
				}else {
					Cookie cookie2 = new Cookie("ck_officialNo", officialNo);
					cookie2.setMaxAge(0);//기존 쿠키 삭제
					cookie2.setPath("/");
					response.addCookie(cookie2);
				}
				
			}else if(result == ProfessorService.PWD_DISAGREE) {
				msg = "비밀번호가 잘못되었습니다";
			}else if(result == ProfessorService.ID_NONE) {
				msg = "존재하지 않는 아이디입니다";
			}
			
		}else if(num.equals("3")) {
			type="student";
			result= studentService.loginCheck(officialNo,pwdd);
			
			if(result == StudentService.LOGIN_OK) {
				
				StudentVO vo = studentService.selectByStuNo(officialNo);
				request.getSession().setAttribute("officialNo", officialNo);
				request.getSession().setAttribute("name", vo.getName());
				request.getSession().setAttribute("type", type);
				request.getSession().setAttribute("identState", vo.getIdentityState());
				
				logger.info("vo= {}", vo);
				
				if(vo.getIdentityState().equals("N")) {
					msg="N";
				}else {
					msg ="student";
				}
				
				
				if(saveNo != null ) {
					Cookie cookie = new Cookie("ck_officialNo", officialNo);
					cookie.setMaxAge(1000*24*24*60);
					cookie.setPath("/");
					response.addCookie(cookie);
				}else {
					Cookie cookie2 = new Cookie("ck_officialNo", officialNo);
					cookie2.setMaxAge(0);//기존 쿠키 삭제
					cookie2.setPath("/");
					response.addCookie(cookie2);
				}
				
			}else if(result == StudentService.PWD_DISAGREE) {
				msg = "비밀번호가 잘못되었습니다";
			}else if(result == StudentService.ID_NONE) {
				msg = "존재하지 않는 아이디입니다";
			}
		}
    }
}
