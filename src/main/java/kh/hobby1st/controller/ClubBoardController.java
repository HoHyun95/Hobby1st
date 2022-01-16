package kh.hobby1st.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hobby1st.dao.ClubBoardDAO;
import kh.hobby1st.dto.ClubBoardDTO;
import kh.hobby1st.dto.ClubBoardReplyDTO;
import kh.hobby1st.service.ClubBoardReplyService;
import kh.hobby1st.service.ClubBoardService;

@Controller
@RequestMapping("/clubBoard/")
public class ClubBoardController {

	@Autowired
	private HttpSession session;
	
	@Autowired
	private ClubBoardDAO dao;

	@Autowired
	private ClubBoardService club_board_service;

	@Autowired
	private ClubBoardReplyService club_board_reply_service;

	@RequestMapping("/boardList")
	public String memberList(int cpage, Model model) throws Exception {
		List<ClubBoardDTO> clubBoardList = club_board_service.selectBoardByPaging(cpage, 5);
		
		int check_num = 1;
		String navi = club_board_service.getPageNavi(cpage, 5);
		int totalBoardCount = club_board_service.getRecordCount(5);

		model.addAttribute("totalBoardCount", totalBoardCount);
		model.addAttribute("check_num", check_num);
		model.addAttribute("cpage", cpage);
		model.addAttribute("navi", navi);
		model.addAttribute("clubBoardList", clubBoardList);

		return "clubBoard/boardList";
	}

//	게시판 작성 페이지 이동
	@RequestMapping("/boardWrite")
	public String boardWrite() {
		return "clubBoard/boardWrite";
	}

	// 게시판 작성
	@RequestMapping("/boardInsert")
	public String boardInsert(ClubBoardDTO dto, Model model) {
		dto.setCb_club_id(5);
		dto.setCb_writer((String) session.getAttribute("mem_id"));

		club_board_service.insert(dto);
		int totalBoardCount = club_board_service.getRecordCount(5);

		return "redirect:/clubBoard/boardList?cpage=1&totalBoardNum=5";
	}

	// 게시판 상세페이지 이동
	@RequestMapping("/boardDetail")
	public String boardDetail(int cb_seq, int cpage, Model model) {

		ClubBoardDTO detail = club_board_service.boardDetail(cb_seq);
		club_board_service.increaseView(cb_seq);
		List<ClubBoardReplyDTO> replyList = club_board_reply_service.selectReply(cb_seq);
		int replycount = club_board_reply_service.replyCount(cb_seq);

		model.addAttribute("replycount", replycount);
		model.addAttribute("cpage", cpage);
		model.addAttribute("replyList", replyList);
		model.addAttribute("detail", detail);
		return "clubBoard/boardDetail";
	}

	// 댓글 작성
	@RequestMapping("/insertReply")
	public String insertReply(ClubBoardReplyDTO dto, int cb_seq) {

		dto.setCbr_writer((String) session.getAttribute("mem_id"));
		dto.setCbr_par_seq(cb_seq);

		club_board_reply_service.plusReply(cb_seq);
		int result = club_board_reply_service.insert(dto);

		return "redirect:/clubBoard/boardDetail?cpage=1&cb_seq=" + cb_seq;
	}

	// 댓글 삭제
	@RequestMapping("/deleteReply")
	public String deleteReply(int cbr_seq, int cb_seq, int cpage) {

		club_board_reply_service.minusReply(cb_seq);
		int result = club_board_reply_service.deleteReply(cbr_seq);

		return "redirect:/clubBoard/boardDetail?cpage=" + cpage + "&cb_seq=" + cb_seq;
	}

	// 게시판 삭제
	@RequestMapping("/deleteBoard")
	public String deleteBoard(int cpage, int cb_seq) {

		int result = club_board_service.deleteBoard(cb_seq);

		return "redirect:/clubBoard/boardList?cpage=" + cpage;
	}

	// 게시판 수정페이지 이동
	@RequestMapping("/modifyBoard")
	public String modifyBoard(int cpage, int cb_seq, Model model) {
		ClubBoardDTO detail = club_board_service.boardDetail(cb_seq);

		model.addAttribute("cpage", cpage);
		model.addAttribute("detail", detail);
		return "clubBoard/modify_boardWrite";
	}

	// 게시판 수정페이지 수정
	@RequestMapping("/updateBoard")
	public String updateBoard(int cpage, Model model, ClubBoardDTO dto) {

		int result = club_board_service.modifyBoard(dto);

		model.addAttribute("result", result);

		return "redirect:/clubBoard/boardDetail?cpage=" + cpage + "&cb_seq=" + dto.getCb_seq();
	}

	// 게시판 검색 기능
	@RequestMapping("/searchBoard")
	public String searchBoard(int cpage, String keyword, String searchWord, Model model) throws Exception {
		int check_num = 2;
		List<ClubBoardDTO> clubBoardList = club_board_service.selectBoardSearchByPaging(cpage, 5, keyword, searchWord);
		List<ClubBoardDTO> list = dao.selectBoardSearchByPaging(1, 10, 5, keyword, searchWord);
		System.out.println(list.get(0).getCb_title());
		
		String navi = club_board_service.getSearchPageNavi(cpage, 5, keyword, searchWord);
				
		int totalBoardCount = club_board_service.getRecordSearchCount(5, keyword, searchWord);

		model.addAttribute("keyword", keyword);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("totalBoardCount", totalBoardCount);
		model.addAttribute("check_num", check_num);
		model.addAttribute("cpage", cpage);
		model.addAttribute("navi", navi);
		model.addAttribute("clubBoardList", clubBoardList);

		return "clubBoard/boardList";
	}

}
