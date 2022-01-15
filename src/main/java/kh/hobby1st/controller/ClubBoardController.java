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

		String navi = club_board_service.getPageNavi(cpage, 5);
		int totalBoardCount = club_board_service.getRecordCount(5);

		model.addAttribute("totalBoardCount", totalBoardCount);
		model.addAttribute("cpage", cpage);
		model.addAttribute("navi", navi);
		model.addAttribute("clubBoardList", clubBoardList);

		System.out.println("동작");
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
		dto.setCb_writer("suhoh01");

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

	// 게시판 댓글 작성
	@RequestMapping("/insertReply")
	public String insertReply(ClubBoardReplyDTO dto, int cb_seq) {

		dto.setCbr_writer((String) session.getAttribute("mem_id"));
		dto.setCbr_par_seq(cb_seq);

		int result = club_board_reply_service.insert(dto);

		return "redirect:/clubBoard/boardDetail?cpage=1&cb_seq=" + cb_seq;
	}

	// 게시판 댓글 삭제
	@RequestMapping("/deleteReply")
	public String deleteReply(int cbr_seq, int cb_seq, int cpage) {

		System.out.println();

		int result = club_board_reply_service.deleteReply(cbr_seq);

		return "redirect:/clubBoard/boardDetail?cpage=" + cpage + "&cb_seq=" + cb_seq;
	}

}
