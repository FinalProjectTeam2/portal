package com.will.portal.board.controller;

import java.io.File;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
import com.will.portal.reply.model.ReplyAllVO;
import com.will.portal.reply.model.ReplyService;
import com.will.portal.reply.model.ReplyVO;
import com.will.portal.reply.model.RereplyVO;

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
	private FilesService filesService;
	
	@Autowired
	private ReplyService replyService;

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
		pagingInfo.setRecordCountPerPage(bdSearchVo.getRecordCountPerPage());
		pagingInfo.setCurrentPage(bdSearchVo.getCurrentPage());

		bdSearchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

		List<PostsVO> list = postsService.selectPostsList(bdSearchVo);
		int totalCount = postsService.selectPostsCount(bdSearchVo);

		pagingInfo.setTotalRecord(totalCount);
		if (pagingInfo.getTotalPage() < pagingInfo.getCurrentPage()) {
			pagingInfo.setCurrentPage(pagingInfo.getTotalPage());
		}

		Map<String, Object> map = new HashedMap<String, Object>();
		map.put("list", list);
		map.put("pagingInfo", pagingInfo);
		map.put("bdSearchVo", bdSearchVo);
		logger.info("list={}", list.size());
		logger.info("pagingInfo={}", pagingInfo);

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
	@RequestMapping(value = "/comment", method = RequestMethod.GET)
	public void comment_get(@RequestParam(defaultValue = "0") int postNo, Model medel) {
		logger.info("게시글 작성 페이지, 파라미터 postNo={}", postNo);
		
		PostsVO postVo = postsService.selectPostByPostNo(postNo);
		
		BoardVO vo = boardService.selectBoardByBdCode(postVo.getBdCode());
		List<BoardVO> list = boardService.selectBoardByCategoryInline(postVo.getBdCode());
		logger.info("게시판 검색 결과 list.size={}, vo={}", list.size(), vo);
		
		medel.addAttribute("vo", vo);
		medel.addAttribute("postVo", postVo);
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

		// 파일 업로드 처리
		List<Map<String, Object>> fileList = fileUploadUtil.fileUpload(request, FileUploadUtil.PATH_PDS);

		String msg = "게시글 작성 실패!", url = "/portal/board/write?bdCode=" + vo.getBdCode();
		if (cnt > 0) {
			for (Map<String, Object> map : fileList) {
				FilesVO fileVo = new FilesVO();
				fileVo.setFileName((String) map.get("fileName"));
				fileVo.setFileSize((Long) map.get("fileSize"));
				fileVo.setOriginalFileName((String) map.get("originalFName"));
				fileVo.setPostNo(vo.getPostNo());

				cnt = filesService.insertFiles(fileVo);
				logger.info("파일 insert 처리 결과 cnt={}", cnt);
			}
			url = "/portal/board/list?bdCode=" + vo.getBdCode();
			msg = "게시글 작성 성공!";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}
	@RequestMapping(value = "/comment", method = RequestMethod.POST)
	public String comment_post(@ModelAttribute PostsVO vo, HttpServletRequest request, Model model) {
		logger.info("답변 작성 처리, 파라미터 vo={}", vo);
		
		int cnt = postsService.insertComment(vo);
		logger.info("답변 작성 처리 결과, cnt={}, vo={}", cnt, vo);
		
		// 파일 업로드 처리
		List<Map<String, Object>> fileList = fileUploadUtil.fileUpload(request, FileUploadUtil.PATH_PDS);
		
		String msg = "답변 작성 실패!", url = "/portal/board/comment?postNo=" + vo.getPostNo();
		if (cnt > 0) {
			for (Map<String, Object> map : fileList) {
				FilesVO fileVo = new FilesVO();
				fileVo.setFileName((String) map.get("fileName"));
				fileVo.setFileSize((Long) map.get("fileSize"));
				fileVo.setOriginalFileName((String) map.get("originalFName"));
				fileVo.setPostNo(vo.getPostNo());
				
				cnt = filesService.insertFiles(fileVo);
				logger.info("파일 insert 처리 결과 cnt={}", cnt);
			}
			url = "/portal/board/list?bdCode=" + vo.getBdCode();
			msg = "답변 작성 성공!";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}

	@RequestMapping(value = "/ajax/write", produces = "text/html;charset=utf8")
	@ResponseBody
	public String ajaxWrite(@RequestParam String contents, @RequestParam String officialNo,
			@RequestParam String bdCode) {
		PostsVO vo = new PostsVO();
		vo.setBdCode(bdCode);
		vo.setContents(contents);
		vo.setTitle(contents.substring(0, 10) + "...");
		vo.setOfficialNo(officialNo);
		logger.info("게시글 작성 처리, 파라미터 vo={}", vo);

		int cnt = postsService.insertPosts(vo);
		logger.info("게시글 작성 처리 결과, cnt={}, vo={}", cnt, vo);

		String msg = "게시글 작성 실패!";
		if (cnt > 0) {
			msg = "게시글 작성 성공!";
		}
		return msg;
	}

	@RequestMapping("/ajax/findBoard")
	@ResponseBody
	public BoardVO findBoard(@RequestParam String bdCode) {
		logger.info("ajax - findBoard 실행, 파라미터 bdCode={}", bdCode);
		return boardService.selectBoardByBdCode(bdCode);
	}

	@RequestMapping("/detailCount")
	public String detailCount(@RequestParam(defaultValue = "0") int postNo, Model model) {

		int count = postsService.upReadCount(postNo);
		logger.info("조회수 증가 결과 count={}", count);

		return "redirect:/portal/board/detail?postNo=" + postNo;
	}

	@RequestMapping("/detail")
	public void detail(@RequestParam(defaultValue = "0") int postNo, Model model) {
		logger.info("게시판 상세보기 페이지");

		PostsAllVO vo = postsService.SelectByCodeE(postNo);
		if (vo == null) {
			vo = postsService.SelectByCodeS(postNo);
			if (vo == null) {
				vo = postsService.SelectByCodeP(postNo);
			}
		}

		logger.info("게시판 상세보기 조회 결과 vo={}", vo);

		model.addAttribute("vo", vo);
	}

	@RequestMapping("/download")
	public ModelAndView download(@RequestParam(defaultValue = "0") int no, @RequestParam String fileName,
			HttpServletRequest request, Model model) {
		// 1.
		logger.info("다운로드 파라미터 no={}, fileName={}", no, fileName);
		// 2.
		int cnt = filesService.upDownCount(no);
		logger.info("다운로드수 증가 cnt={}", cnt);

		// 다운로드 처리를 위한 페이지로 넘겨준다
		String upPath = fileUploadUtil.getUploadPath(request, FileUploadUtil.PATH_PDS);
		File file = new File(upPath, fileName);

		// 3.

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("file", file);

		// 4.
		// model에 map 넣기
		ModelAndView mav = new ModelAndView("reBoardDownloadView", map);
		return mav;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit_get(@RequestParam(defaultValue = "0") int postNo, Model model) {
		logger.info("게시글 수정 페이지");
		if (postNo == 0) {
			model.addAttribute("msg", "잘못될 URL입니다.");
			model.addAttribute("url", "/portal/board/list");
			return "common/message";
		}
		PostsAllVO postVo = postsService.SelectByCodeE(postNo);
		if (postVo == null) {
			postVo = postsService.SelectByCodeS(postNo);
			if (postVo == null) {
				postVo = postsService.SelectByCodeP(postNo);
			}
		}

		logger.info("게시판 수정 페이지 조회 결과 vo={}", postVo);

		BoardVO bdvo = boardService.selectBoardByBdCode(postVo.getPostsVo().getBdCode());
		List<BoardVO> list = boardService.selectBoardByCategoryInline(postVo.getPostsVo().getBdCode());
		logger.info("게시판 검색 결과 list.size={}, vo={}", list.size(), bdvo);

		model.addAttribute("postVo", postVo);
		model.addAttribute("vo", bdvo);
		model.addAttribute("list", list);

		return "portal/board/edit";
	}

	@PostMapping(value = "/edit")
	public String edit_post(@RequestParam String title, @RequestParam String contents, @RequestParam int postNo,
			HttpServletRequest request, Model model) {
		logger.info("게시글 수정 처리");
		PostsVO vo = new PostsVO();
		vo.setPostNo(postNo);
		vo.setContents(contents);
		vo.setTitle(title);
		logger.info("게시글 수정 처리, 파라미터 vo={}", vo);

		int cnt = postsService.updatePost(vo);
		logger.info("게시글 수정 처리 결과, cnt={}, vo={}", cnt, vo);

		// 파일 업로드 처리
		List<Map<String, Object>> fileList = fileUploadUtil.fileUpload(request, FileUploadUtil.PATH_PDS);

		String msg = "게시글 수정 실패!", url = "/portal/board/edit?postNo=" + postNo;
		if (cnt > 0) {
			for (Map<String, Object> map : fileList) {
				FilesVO fileVo = new FilesVO();
				fileVo.setFileName((String) map.get("fileName"));
				fileVo.setFileSize((Long) map.get("fileSize"));
				fileVo.setOriginalFileName((String) map.get("originalFName"));
				fileVo.setPostNo(vo.getPostNo());

				cnt = filesService.insertFiles(fileVo);
				logger.info("파일 insert 처리 결과 cnt={}", cnt);
			}
			url = "/portal/board/detail?postNo=" + postNo;
			msg = "게시글 수정 완료!";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}

	@RequestMapping(value = "/delete")
	public String deleteOk(@RequestParam(defaultValue = "0") int postNo, HttpServletRequest request) {
		logger.info("게시글 삭제 처리 파라미터 postNo={}", postNo);

		PostsVO vo = postsService.selectPostByPostNo(postNo);
		logger.info("vo={}", vo);

		Map<String, String> map = new HashMap<String, String>();
		map.put("post_no", vo.getPostNo()+"");
		map.put("step", vo.getStep()+"");
		map.put("group_no", vo.getGroupNo()+"");
		int cnt = postsService.deletePostByPostNo(map);
		logger.info("삭제 결과 cnt={}", cnt);
		
		List<FilesVO> list = filesService.selectFileByPostNo(postNo);
		boolean bool = false;
		for (FilesVO fvo : list) {
			bool = fileUploadUtil.fileDelete(request, fvo.getFileName(), FileUploadUtil.PATH_PDS);
			if (bool) {
				cnt = filesService.deleteFile(fvo.getNo());
				if (cnt <= 0) {
					bool = false;
				}
			}
		}
		
		logger.info("파일 삭제 처리 결과 bool={}", bool);

		
		
		return "redirect:/portal/board/list?bdCode=" + vo.getBdCode();
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
		List<CategoryListVO> list = boardService.selectCategoryList();
		logger.info("list.size={}", list.size());
		return list;
	}

	@RequestMapping("/ajax/delFile")
	@ResponseBody
	public String name(@RequestParam int no, @RequestParam String fileName, HttpServletRequest request) {
		logger.info("ajax - 파일 삭제 처리");
		boolean bool = fileUploadUtil.fileDelete(request, fileName, FileUploadUtil.PATH_PDS);
		logger.info("파일 삭제 처리 결과 bool={}", bool);

		if (bool) {
			int cnt = filesService.deleteFile(no);
			if (cnt <= 0) {
				bool = false;
			}
		}

		return bool + "";
	}
	
	@RequestMapping(value = "/ajax/reply", produces = "text/html;charset=utf8")
	@ResponseBody
	public String reply(@RequestParam String officialNo,@RequestParam String contents, 
			@RequestParam int postNo, @RequestParam int replyNo, @RequestParam String officialName) {
		logger.info("ajax - 댓글 등록 처리");
		logger.info("파라미터 - officialNo={}, contents={}",officialNo,contents);
		logger.info("파라미터 - postNo={}, replyNo={}",postNo,replyNo);
		logger.info("파라미터 - officialName={}",officialName);
		
		String result = "댓글 등록 실패";
		int cnt = 0;
		if(replyNo == 0) {
			ReplyVO vo = new ReplyVO();
			vo.setContents(contents);
			vo.setOfficialNo(officialNo);
			vo.setPostNo(postNo);
			vo.setOfficialName(officialName);
			cnt = replyService.insertReply(vo);
		}else {
			RereplyVO vo = new RereplyVO();
			vo.setContents(contents);
			vo.setOfficialNo(officialNo);
			vo.setReplyNo(replyNo);
			vo.setOfficialName(officialName);
			cnt = replyService.insertRereply(vo);
		}
		
		if(cnt > 0) {
			result = "댓글 등록 성공!";
		}
		return result;
	}
	
	@RequestMapping("/ajax/replyList")
	@ResponseBody
	public Map<String, Object> replyList(@RequestParam int postNo){
		logger.info("ajax - 댓글 보여주기, 파라미터 postNo={}",postNo);
		List<ReplyAllVO> list = replyService.selectReplyByPostNo(postNo);
		logger.info("댓글 조회 결과, list.size=",list.size());
		
		Map<String, Object> map = new HashedMap<String, Object>();
		map.put("list", list);
		return map;
	}
}
