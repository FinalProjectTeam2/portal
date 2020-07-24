package com.will.portal.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component
public class FileUploadUtil {
	
	private Logger logger = LoggerFactory.getLogger(FileUploadUtil.class);
	
	@Resource(name = "fileUploadProperties")
	Properties fileUploadProps;
	
	public static final int PATH_PDS=1; //자료실 사용
	public static final int PATH_PD_IMAGE=2; //상품 업로드시 사용
	
	public List<Map<String, Object>> fileUpload(HttpServletRequest request, int pathGb) {
		//파일 업로드 처리 메서드
		MultipartHttpServletRequest multiReq = (MultipartHttpServletRequest)request;
		
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		
		Map<String, MultipartFile> fileMap = multiReq.getFileMap();
		Iterator<String> iter = fileMap.keySet().iterator();
		while(iter.hasNext()) {
			String key = iter.next();
			
			MultipartFile tempFile = fileMap.get(key);
			//=> 업로드된 파일을 임시파일 형태로 제공
			
			//업로드 한 경우에 파일크기, 이름 구하기
			if(!tempFile.isEmpty()) {
				String originalFName = tempFile.getOriginalFilename();
				long fileSize = tempFile.getSize();
				//변경된 파일 명 구하기
				String fileName = getUniqueFileName(originalFName);
				//업로드 처리
				String upPath = getUploadPath(request, pathGb);
				File file = new File(upPath, fileName);
				try {
					tempFile.transferTo(file);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				logger.info("업로드 처리되었습니다.");
				
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("fileSize", fileSize);
				map.put("fileName", fileName);
				map.put("originalFName", originalFName);
				
				resultList.add(map);
			}
		}	//while
		
		return resultList;
	}
	public String getUploadPath(HttpServletRequest request, int pathGb){
		
		String type = fileUploadProps.getProperty("file.upload.type");
		//=>test, deploy
		String uploadPath = "";
		String key = "";
		
		if(type.equals("test")) { //테스트시
	         if(pathGb==PATH_PDS) {
	            key="file.upload.path.test";
	         }else if(pathGb==PATH_PD_IMAGE) {
	            key="imageFile.upload.path.test";
	         }
	         
	         uploadPath=fileUploadProps.getProperty(key);
	      }else { //deploy-배포시
	         if(pathGb==PATH_PDS) {
	            key="file.upload.path";
	         }else if(pathGb==PATH_PD_IMAGE) {
	            key="imageFile.upload.path";
	         }

	         uploadPath=fileUploadProps.getProperty(key);
	         //실제 물리적인 경로 구하기
	         HttpSession session=request.getSession();
	         uploadPath
	            =session.getServletContext().getRealPath(uploadPath);
	      }

		logger.info("type={}, uploadpath={}", type, uploadPath);
		
		return uploadPath;
	}
	
	public String getUniqueFileName(String originalFName) {
		//변경된 파일명 
		//a.txt => a_현재시간.txt
		int idx = originalFName.lastIndexOf(".");
		
		String fname = originalFName.substring(0, idx);	//a
		String ext = originalFName.substring(idx);	//.txt
		
		String fileName = fname + "_" + getTimeStamp() + ext;
		
		logger.info("변경된 파일명 = {}", fileName);
		return fileName;
		
	}
	
	public String getTimeStamp() {
		//현재시간을 밀리초까지 지정해서 리턴
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		Date d = new Date();
		String str =  sdf.format(d);
		
		return str;
	}
	
	
}











