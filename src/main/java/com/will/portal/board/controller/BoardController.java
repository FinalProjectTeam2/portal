package com.will.portal.board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections4.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.will.portal.board.model.BoardSearchVO;
import com.will.portal.board.model.BoardService;
import com.will.portal.board.model.BoardVO;
import com.will.portal.category.model.CategoryListVO;
import com.will.portal.common.FileUploadUtil;
import com.will.portal.common.PaginationInfo;
import com.will.portal.common.Utility;
import com.will.portal.files.model.FilesService;
import com.will.portal.files.model.FilesVO;
import com.will.portal.posts.model.PostsAllVO;
import com.will.portal.posts.model.PostsService;
import com.will.portal.posts.model.PostsVO;

@Controller
@RequestMapping("/portal/board")
public class BoardController {
	@Autowired
	private PostsService postsService;

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardService boardService;

	@Autowired
	private FileUploadUtil fileUploadUtil;
	
	@Autowired
	private FilesService filesSercive;

	@RequestMapping("/main")
	public void boardMain(@RequestParam(defaultValue = "B") String categoryCode) {
		logger.info("게시판 메인 페이지, 파라미터 categoryCode={}", categoryCode);

	}

	@RequestMapping("/list")
	public void board(@RequestParam(defaultValue = "F") String bdCode, Model model) {
		logger.info("게시판 목록 페이지, 파라미터 bdCode={}", bdCode);

		BoardVO boardVo = boardService.selectBoardByBdCode(bdCode);
		logger.info("게시판 검색 결과, boardVo={}", boardVo);
		model.addAttribute("boardVo", boardVo);
	}

	@RequestMapping("/ajax/list")
	@ResponseBody
	public Map<String, Object> ajaxList(@ModelAttribute BoardSearchVO bdSearchVo) {
		logger.info("게시판 조회, 파라미터 bdSearchVo={}", bdSearchVo);

		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo.setCurrentPage(bdSearchVo.getCurrentPage());

		bdSearchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		bdSearchVo.setRecordCountPerPage(Utility.RECORD_COUNT);

		List<PostsVO> list = postsService.selectPostsList(bdSearchVo);
		int totalCount = postsService.selectPostsCount(bdSearchVo);

		pagingInfo.setTotalRecord(totalCount);

		Map<String, Object> map = new HashedMap<String, Object>();
		map.put("list", list);
		map.put("pagingInfo", pagingInfo);

		return map;

	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void write_get(@RequestParam(defaultValue = "F") String bdCode, Model medel) {
		logger.info("게시글 작성 페이지, 파라미터 bdCode={}", bdCode);

		BoardVO vo = boardService.selectBoardByBdCode(bdCode);
		List<BoardVO> list = boardService.selectBoardByCategoryInline(bdCode);
		logger.info("게시판 검색 결과 list.size={}, vo={}", list.size(), vo);

		medel.addAttribute("vo", vo);
		medel.addAttribute("list", list);
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write_post(@RequestParam String title, @RequestParam String contents, @RequestParam String officialNo,
			@RequestParam String bdCode, HttpServletRequest request, Model model) {
		PostsVO vo = new PostsVO();
		vo.setBdCode(bdCode);
		vo.setContents(contents);
		vo.setTitle(title);
		vo.setOfficialNo(officialNo);
		logger.info("게시글 작성 처리, 파라미터 vo={}", vo);
		
		int cnt = postsService.insertPosts(vo);
		logger.info("게시글 작성 처리 결과, cnt={}, vo={}", cnt, vo);
		
		//파일 업로드 처리
		List<Map<String, Object>> fileList
		=fileUploadUtil.fileUpload(request, FileUploadUtil.PATH_PDS);
		
		String msg = "게시글 작성 실패!", url = "/portal/board/write?bdCode=" + vo.getBdCode();
		if(cnt >0) {
			for(Map<String, Object> map : fileList) {
				FilesVO fileVo = new FilesVO();
				fileVo.setFileName((String) map.get("fileName"));
				fileVo.setFileSize((Long) map.get("fileSize"));
				fileVo.setOriginalFileName((String) map.get("originalFName"));
				fileVo.setPostNo(vo.getPostNo());
				
				cnt = filesSercive.insertFiles(fileVo);
				logger.info("파일 insert 처리 결과 cnt={}", cnt);
			}
			url = "/portal/board/list?bdCode=" + vo.getBdCode();
			msg = "게시글 작성 성공!";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}

	@RequestMapping("/ajax/findBoard")
	@ResponseBody
	public BoardVO findBoard(@RequestParam String bdCode) {
		logger.info("ajax - findBoard 실행, 파라미터 bdCode={}", bdCode);
		return boardService.selectBoardByBdCode(bdCode);
	}

	@RequestMapping("/detail")
	public String detail(@RequestParam(defaultValue = "0") int postNo, Model model) {
		logger.info("게시판 상세보기 페이지");
		if(postNo == 0) {
			model.addAttribute("msg", "잘못된 경로입니다.");
			model.addAttribute("url","/portal/board/list");
			return "common/message";
		}
		
		PostsAllVO vo = postsService.SelectByCodeE(postNo);
		if(vo == null) {
			vo = postsService.SelectByCodeS(postNo);
			if(vo == null) {
				vo = postsService.SelectByCodeP(postNo);
			}
		}
		
		logger.info("게시판 상세보기 조회 결과 vo={}",vo);
		
		model.addAttribute("vo", vo);
		
		return "/portal/board/detail";
	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public void edit_get() {
		logger.info("게시글 수정 페이지");
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void delete_get() {
		logger.info("게시글 삭제 페이지");
	}

	@RequestMapping(value = "/re", method = RequestMethod.GET)
	public String re_get() {
		return "board/re";
	}

	@RequestMapping(value = "/calendarDetail", method = RequestMethod.GET)
	public String calendarDetail_get() {
		return "board/calendarDetail";

	}

	@RequestMapping(value = "/schedule1", method = RequestMethod.GET)
	public String schedule1_get() {

		return "board/schedule1";
	}

	@RequestMapping(value = "/lectureSchedule1", method = RequestMethod.GET)
	public String lectureSchedule1_get() {

		return "board/lectureSchedule1";
	}

	@RequestMapping(value = "/privacy1", method = RequestMethod.GET)
	public String privacy1_get() {

		return "board/privacy1";
	}

	@RequestMapping(value = "/privacy2", method = RequestMethod.GET)
	public String privacy2_get() {

		return "board/privacy2";
	}

	@RequestMapping(value = "/issueacertificate", method = RequestMethod.GET)
	public String issueacertificate_get() {

		return "board/issueacertificate";
	}

	@RequestMapping(value = "/lectureScheduleLogin", method = RequestMethod.GET)
	public String lectureScheduleLogin_get() {

		return "board/lectureScheduleLogin";
	}

	@RequestMapping("/ajax/cateList")
	@ResponseBody
	public List<CategoryListVO> cateList() {
		logger.info("ajax categoryList");
		return boardService.selectCategoryList();
	}
}
