package kh.hobby1st.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hobby1st.dao.NoticeDAO;
import kh.hobby1st.dto.NoticeDTO;
import kh.hobby1st.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private HttpSession session;

	@Autowired
	private NoticeService notService;
	
	@Autowired
	private NoticeDAO dao;

	// 공지사항 리스트로 이동
	@RequestMapping("/noticeList")
	public String noticeList(int cpage, Model model)throws Exception {

		List<NoticeDTO> noticeList = notService.selectNoticeAll(cpage);

		int check_num = 1;
		String navi = notService.getPageNavi(cpage);
		int totalNoticeCount = notService.getRecordCount();

		model.addAttribute("totalNoticeCount", totalNoticeCount);
		model.addAttribute("check_num", check_num);
		model.addAttribute("cpage", cpage);
		model.addAttribute("navi", navi);
		model.addAttribute("noticeList", noticeList);

		return "notice/noticeList";
	}

	// 공지사항 작성 페이지 이동 
	@RequestMapping("/noticeWrite")
	public String noticeWrite() {
		return "notice/noticeWrite";
	}

	// 공지사항 작성
	@RequestMapping("/noticeInsert")
	public String noticeInsert(NoticeDTO dto) {

		dto.setNotice_writer((String) session.getAttribute("mem_id"));
		notService.insert(dto);

		return "redirect:/notice/noticeList?cpage=1";
	}


	// 공지사항 상세페이지 이동
	@RequestMapping("/noticeDetail")
	public String boardDetail(int notice_seq, int cpage, Model model, int check_num, String keyword, String searchWord) {

		if (keyword.equals("title")) {
			keyword = "제목";
		} else if (keyword.equals("writer")) {
			keyword = "작성자";
		}
		String rec_id = (String) session.getAttribute("mem_id");

		//			String writerProfile = notService.writerProfile(not_seq);

		NoticeDTO detail = notService.noticeDetail(notice_seq);
		notService.increaseView(notice_seq);
		//			

		//			model.addAttribute("writerProfile", writerProfile);

		model.addAttribute("keyword", keyword);
		model.addAttribute("searchWord", searchWord);
		//			model.addAttribute("replycount", replycount);
		model.addAttribute("check_num", check_num);
		//			model.addAttribute("user", user); 
		model.addAttribute("cpage", cpage); 
		//			model.addAttribute("replyList", replyList);
		model.addAttribute("detail", detail);
		return "notice/noticeDetail";
	}

	// 공지사항 삭제
	@RequestMapping("/deleteNotice")
	public String deleteBoard(int cpage, int notice_seq) {

		int result = notService.deleteNotice(notice_seq);

		return "redirect:/notice/noticeList?cpage=" + cpage;
	}


	// 공지사항 수정페이지 이동
	@RequestMapping("/modifyNotice")
	public String modifyBoard(int cpage, int notice_seq, Model model, int check_num, String keyword, String searchWord) {
		NoticeDTO detail = notService.noticeDetail(notice_seq);

		model.addAttribute("keyword", keyword);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("check_num", check_num);
		model.addAttribute("cpage", cpage);
		model.addAttribute("detail", detail);
		return "notice/modify_noticeWrite";
	}

	// 공지사항 수정페이지 수정
	@RequestMapping("/updateNotice")
	public String updateBoard(int cpage, Model model, NoticeDTO dto, int check_num, String keyword,
			String searchWord) {

		if (keyword.equals("제목")) {
			keyword = "title";
		} else if (keyword.equals("작성자")) {
			keyword = "writer";
		}

		int result = notService.modifyNotice(dto);

		model.addAttribute("result", result);

		return "redirect:/notice/noticeDetail?cpage=" + cpage + "&notice_seq=" + dto.getNotice_seq() + "&keyword=" + keyword
				+ "&searchWord=" + searchWord + "&check_num=" + check_num;
	}
	
	// 게시판 검색 기능
	@RequestMapping("/searchNotice")
	public String searchNotice(int cpage, String keyword, String searchWord, Model model) throws Exception {
		int check_num = 2;
		System.out.println(keyword + searchWord);
		List<NoticeDTO> noticeList = notService.selectNoticeSearchByPaging(cpage, 5, keyword, searchWord);
		List<NoticeDTO> list = dao.selectBoardSearchByPaging(1, 10, 5, keyword, searchWord);

		String navi = notService.getSearchPageNavi(cpage, 5, keyword, searchWord);

		int totalBoardCount = notService.getRecordSearchCount(5, keyword, searchWord);

		model.addAttribute("keyword", keyword);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("totalBoardCount", totalBoardCount);
		model.addAttribute("check_num", check_num);
		model.addAttribute("cpage", cpage);
		model.addAttribute("navi", navi);
		model.addAttribute("clubBoardList",	noticeList);

		return "clubBoard/boardList";
	}


	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:/";
	}
}
