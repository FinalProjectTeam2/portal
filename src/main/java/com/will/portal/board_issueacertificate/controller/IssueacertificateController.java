package com.will.portal.board_issueacertificate.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.will.portal.certification.model.CertificationService;
import com.will.portal.certification.model.CertificationVO;
import com.will.portal.common.MemberDetails;

@Controller
public class IssueacertificateController {
	@Autowired
	private CertificationService certService;
	private static final Logger logger = LoggerFactory.getLogger(IssueacertificateController.class);
	
	@RequestMapping(value="/board_issueacertificate/issueacertificate", method = RequestMethod.GET) 
	public String issueacertificate_get(Principal principal, Model model) {
		MemberDetails user = (MemberDetails)((Authentication)principal).getPrincipal();
		String stuNo = user.getOfficialNo();
		
		List<CertificationVO> list = certService.selectByStuNo(stuNo);
		
		model.addAttribute("list", list);
		
		
		
		return "board_issueacertificate/issueacertificate";
	}
	
	@RequestMapping(value = "/payments/complete", method = RequestMethod.POST)
	@ResponseBody
	public String paymentsComplete(HttpServletRequest request, HttpServletResponse response, Principal principal, @RequestParam String certCode, 
			@RequestParam(defaultValue = "1") int qty, @RequestParam String certName, Model model) throws Exception {
		
		MemberDetails user = (MemberDetails)((Authentication)principal).getPrincipal();
		String stuNo = user.getOfficialNo();
		
		logger.info("파라미터 stuNo={}, certName={}", stuNo, certName);
		logger.info("파라미터 qty={}, certCode={}", qty, certCode);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		Date d = new Date();
		String year =sdf.format(d);
		
		int num = certService.getSeq();
		int len = (int)(Math.log10(num)+1);
		String temp = "";
		logger.info("sequence길이 len={}", len);
		
		if(len == 1) {
			temp+="000"+num;
		}else if(len==2) {
			temp+="00"+num;
		}else if(len==3) {
			temp+="0"+num;
		}else {
			temp=num+"";
		}
		
		String no=year+"-"+temp;
		
		CertificationVO vo = new CertificationVO();
		vo.setCertCode(certCode);
		vo.setCertName(certName);
		vo.setNo(no);
		vo.setStuNo(stuNo);
		vo.setQty(qty);
		
		int cnt = certService.insertCert(vo);
		
		String result="결제 실패";
		
		if(cnt > 0) {
			result="결제완료 증명서 현황에서 출력하세요";
		}
		
		List<CertificationVO> list = certService.selectByStuNo(stuNo);
		
		model.addAttribute("list", list);
		
		
		//rest api token받아오기
		
		String imp_key 		=	URLEncoder.encode("4751038655300640", "UTF-8");

		String imp_secret	=	URLEncoder.encode("jwpuruLyKMQCGKvOUL5Ajga698gq6l5qSuUjZGSJsIm9sSXnD3YXk84thlUnHZNzuITuoLeRtA0WtYk6", "UTF-8");

		JSONObject json = new JSONObject();

		json.put("imp_key", imp_key);

		json.put("imp_secret", imp_secret);

		String requestURL="https://api.iamport.kr/users/getToken";
		String _token = getToken(request, response, json, requestURL); 
		
		
		
		logger.info("token값 _token={}", _token);
		
		
		
		
		
		
		
		
		return result;
		
	}
	
	
	/**
	 * restAPI 서버에서 token받아오기
	 * @param request
	 * @param response
	 * @param json
	 * @param requestURL
	 * @return
	 * @throws Exception
	 */
	public String getToken(HttpServletRequest request,HttpServletResponse response,JSONObject json

			,String requestURL) throws Exception{

		

		// requestURL 아임퐅크 고유키, 시크릿 키 정보를 포함하는 url 정보 

		String _token = "";

		try{

			String requestString = "";

			URL url = new URL(requestURL);

			HttpURLConnection connection = (HttpURLConnection) url.openConnection();

			connection.setDoOutput(true); 				

			connection.setInstanceFollowRedirects(false);  

			connection.setRequestMethod("POST");

			connection.setRequestProperty("Content-Type", "application/json");

			OutputStream os= connection.getOutputStream();

			os.write(json.toString().getBytes());

			connection.connect();

			StringBuilder sb = new StringBuilder(); 

			if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {

				BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));

			

				String line = null;  

				while ((line = br.readLine()) != null) {  

					sb.append(line + "\n");  

				}

				br.close();

				requestString = sb.toString();

			

			}

			os.flush();

			connection.disconnect();

			

			JSONParser jsonParser = new JSONParser();

			JSONObject jsonObj = (JSONObject) jsonParser.parse(requestString);

			

			if((Long)jsonObj.get("code")  == 0){

				JSONObject getToken = (JSONObject) jsonObj.get("response");

				System.out.println("getToken==>>"+getToken.get("access_token") );

				_token = (String)getToken.get("access_token");

			}

			

		}catch(Exception e){

			e.printStackTrace();

			_token = "";

		}

		return _token;

	}
}
