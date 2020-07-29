package com.will.portal.login.controller;

import java.security.Principal;

import javax.mail.MessagingException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.will.portal.email.EmailSender;
import com.will.portal.employee.model.EmployService;
import com.will.portal.employee.model.EmployeeVO;
import com.will.portal.professor.model.ProfessorService;
import com.will.portal.professor.model.ProfessorVO;
import com.will.portal.student.model.StudentService;
import com.will.portal.student.model.StudentVO;


@Controller
@RequestMapping("/login")
public class LoginController {
	private static final Logger logger
		= LoggerFactory.getLogger(LoginController.class);
	@Autowired private EmailSender emailSender;
	@Autowired private StudentService studentService;
	@Autowired private ProfessorService professorService;
	@Autowired private EmployService employeeService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login_get() {
		logger.info("로그인 화면 보여주기");
		return "login/login";
	}
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, Model model) {
		logger.info("로그인 화면 보여주기");
		if (error != null) {

			model.addAttribute("error", "Invalid username and password!");

		}

		if (logout != null) {

			model.addAttribute("msg", "You've been logged out successfully.");

		}
		return "login/login2";
	}
	
	
	@RequestMapping(value = "/loginGO", method = RequestMethod.POST , produces = "application/text; charset=utf8")
	@ResponseBody
	public String login_post(@RequestParam String officialNo, @RequestParam String pwdd,
			@RequestParam (required = false) String saveNo,
			HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("로그인 처리, 파라미터 officialNo={}, pwd={}",officialNo,pwdd);
		String msg="로그인 실패";
		
		String num = officialNo.substring(4,5);
		String type="";
		int result = 0;
		
		if(num.equals("1")) {
			type="admin";
			result= employeeService.loginCheck(officialNo,pwdd);
			
			if(result == EmployService.LOGIN_OK) {
				msg ="admin";
				EmployeeVO empVo = employeeService.selectByEmpNo(officialNo);
				request.getSession().setAttribute("officialNo", officialNo);
				request.getSession().setAttribute("name", empVo.getEmpName());
				request.getSession().setAttribute("type", type);
				Principal prin = new Principal() {
					
					@Override
					public String getName() {
						// TODO Auto-generated method stub
						return null;
					}
				};
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
		logger.info(msg);
		return msg;
	}
	
	@RequestMapping(value = "/findPwd", method = RequestMethod.GET)
	public String findPwd_get() {
		logger.info("로그인 화면 보여주기");
		return "login/findPwd";
	}
	
	@RequestMapping(value = "/findId")
	public String findId() {
		logger.info("로그인 화면 보여주기");
		return "login/findId";
	}
	
	@RequestMapping(value = "/inputChgPwd")
	public String inputChgPwd() {
		logger.info("비밀번호 변경 화면 보여주기");
		return "login/inputChgPwd";
	}
	
	@RequestMapping(value = "/adminLogin")
	public String adminLogin() {
		logger.info("비밀번호 변경 화면 보여주기");
		return "login/adminLogin";
	}
	
	@RequestMapping(value = "/findPwdProf")
	public String forProf() {
		logger.info("비밀번호 변경 화면 보여주기");
		return "login/findPwdProf";
	}
	
	@RequestMapping(value = "/chkId", method = RequestMethod.POST)
	@ResponseBody
	public boolean chkId(@RequestParam String stuNo) {
		logger.info("아이디 확인 stuNo = {}", stuNo);
		boolean bool = true;
		//stuNo 존재한다면 true;
		return bool;
		
	}
	
	//메일발송
	public void send() {
		logger.info("메일발송 처리");

		String subject = "회원님의 비밀번호입니다";
		String content = "회원님의 비밀번호는"+"0000"+"입니다";
		String receiever = "shn6314@naver.com";
		String sender = "admin@portal.com";
		
		try {
			emailSender.mailSend(subject,content, receiever, sender);
			logger.info("발송성공");
		} catch (MessagingException e) {
			e.printStackTrace();
			logger.info("발송실패");
		}
		
	}
	
	@RequestMapping(value = "/idnt")
	@ResponseBody
	public boolean idntBt(@RequestParam String name,
			@RequestParam String ssn1,
			@RequestParam String ssn2) {
		logger.info("본인인증 name = {}", name);
		boolean bool = true;
		if(bool) {
			send();
		}
		return bool;
		
	}
}
