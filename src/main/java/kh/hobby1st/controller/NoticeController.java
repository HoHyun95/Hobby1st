package kh.hobby1st.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hobby1st.dto.ClubBoardDTO;
import kh.hobby1st.dto.ClubBoardReplyDTO;
import kh.hobby1st.dto.NoticeDTO;
import kh.hobby1st.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private HttpSession session;
	
	@Autowired
	private NoticeService notService;
	
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
	@RequestMapping("noticeWrite")
	public String noticeWrite() {
		return "notice/noticeWrite";
	}
	
	// 공지사항 작성
	@RequestMapping("noticInsert")
	public String noticeInsert(NoticeDTO dto) {
		
		dto.setNot_writer((String) session.getAttribute("mem_id"));
		notService.insert(dto);
		
		return "redirect:/notice/noticeList";
	}
	
	
	// 게시판 상세페이지 이동
		@RequestMapping("/noticeDetail")
		public String boardDetail(int not_seq, int cpage, Model model, int check_num, String keyword, String searchWord) {

			if (keyword.equals("title")) {
				keyword = "제목";
			} else if (keyword.equals("writer")) {
				keyword = "작성자";
			}
			String rec_id = (String) session.getAttribute("mem_id");

//			String writerProfile = notService.writerProfile(not_seq);
			

			
			NoticeDTO detail = notService.noticeDetail(not_seq);
			notService.increaseView(not_seq);
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
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:/";
	}
}
