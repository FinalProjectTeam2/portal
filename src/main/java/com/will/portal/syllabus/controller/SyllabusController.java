package com.will.portal.syllabus.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


@Controller
public class SyllabusController {
	private static final Logger logger = LoggerFactory.getLogger(SyllabusController.class);
	
	
	@RequestMapping(value = "/syllabus/upload", method = RequestMethod.GET)
    public void syllabusUpload() {
		logger.info("교수 pdf 업로드 페이지");
	}
	
	
	
	
	@RequestMapping(value = "/syllabus/upload", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String syllabusUpload(MultipartHttpServletRequest mtfRequest) {
        logger.info("pdf업로드 페이지");
        
		List<MultipartFile> fileList = mtfRequest.getFiles("files");
       
        
        String path = "D:\\lecture\\finalProj_ws\\portal\\src\\main\\webapp\\pdfUpload\\";

        for (MultipartFile mf : fileList) {
            String originalFName = mf.getOriginalFilename(); // 원본 파일 명
            long fileSize = mf.getSize(); // 파일 사이즈
            
            int idx = originalFName.lastIndexOf(".");
    		
    		String fname = originalFName.substring(0, idx);	
    		String ext = originalFName.substring(idx);	
    		
    		logger.info("원본파일명={}, 파일 사이즈={}", originalFName, fileSize);
    		
    		String fileName = path + fname + "_" + System.currentTimeMillis() + ext;
    		
    		logger.info("변경된 파일명 = {}", fileName);
            
            try {
                mf.transferTo(new File(fileName));
            } catch (IllegalStateException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

        return "syllabus/upload";
    }


}
