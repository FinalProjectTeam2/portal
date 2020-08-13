package com.will.portal.common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.will.portal.professor.model.ProfessorVO;
import com.will.portal.student.model.StudentVO;

public class LoginSuccessHandler implements AuthenticationSuccessHandler{
	
	private static final Logger logger = LoggerFactory.getLogger(LoginSuccessHandler.class);

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		MemberDetails user = (MemberDetails) authentication.getPrincipal();
		String saveNo = request.getParameter("saveNo");
		logger.info("로그인 성공!, 파라미터 saveNo={}",saveNo);
		
		request.getSession().setMaxInactiveInterval(60*60);
		
		if(saveNo != null ) {
			Cookie cookie = new Cookie("ck_officialNo", user.getOfficialNo());
			cookie.setMaxAge(1000*24*24*60);
			cookie.setPath("/");
			response.addCookie(cookie);
			logger.info("쿠키저장 완료");
		}else {
			Cookie cookie2 = new Cookie("ck_officialNo", user.getOfficialNo());
			cookie2.setMaxAge(0);//기존 쿠키 삭제
			cookie2.setPath("/");
			response.addCookie(cookie2);
			logger.info("쿠키삭제 완료");
		}
		
		
		if (user.getType().equals("ADMIN")) {
			
			response.sendRedirect(request.getContextPath() + "/index");
			return;
			
		}else if(user.getType().equals("PROFESSOR")) {
			
			if(((ProfessorVO)user).getIdentityState().equals("N")) {
				response.sendRedirect(request.getContextPath() + "/member/changePwd");
				return;
			}
			
		}else if(user.getType().equals("STUDENT")) {
			
			if(((StudentVO)user).getIdentityState().equals("N")) {
				response.sendRedirect(request.getContextPath() + "/member/changePwd");
				return;
			}
			
		}
		response.sendRedirect(request.getContextPath() + "/index");
		
	}

}
