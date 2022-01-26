package kh.hobby1st.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.hobby1st.dto.ClubJoinStateDTO;
import kh.hobby1st.dto.ClubListDTO;
import kh.hobby1st.service.ClubJoinStateService;
import kh.hobby1st.service.ClubListService;

@Controller
@RequestMapping("/club/")
public class ClubController {

	@Autowired
	private HttpSession session;

	@Autowired
	private ClubJoinStateService csService;
	
	@Autowired
	private ClubListService clService;

	// 동호회 가입 요청
	@RequestMapping("requestJoin")
	public String requestJoin(ClubJoinStateDTO dto) throws Exception {

		int result = csService.requestJoin(dto);

		return "redirect:/clubHouse?cl_id=" + dto.getCs_board_seq();
	}

	// 동호회 가입 요청 승인
	@RequestMapping("joinApprove")
	public String joinApprove(int cs_board_seq, String cs_join_id) throws Exception {
		
		csService.joinApprove(cs_board_seq, cs_join_id);

		System.out.println("승인");

		return "redirect:/myPage";
	}

	// 동호회 가입 요청 거절
	@RequestMapping("joinRefuse")
	public String joinRefuse(int cs_board_seq, String cs_join_id) throws Exception {

		System.out.println("거절");
		csService.joinRefuse(cs_board_seq, cs_join_id);

		return "redirect:/myPage";
	}
	
	// 동호회 탈퇴 하기
	@RequestMapping("leaveClub")
	public String leaveClub(int cs_board_seq, String cs_join_id, Model model) throws Exception {

		int result = csService.leaveClub(cs_join_id, cs_board_seq);
		ClubListDTO club = clService.selectClub(String.valueOf(cs_board_seq));
		
		model.addAttribute("club", club);
		model.addAttribute("cs_board_seq", cs_board_seq);
		model.addAttribute("result", result);
		return "clubHouse";
	}
	
	// 동호회 해체 시키기
	@RequestMapping("breakClub")
	public String breakClub(int board_seq, Model model) throws Exception {

		int break_result = csService.breakClub(board_seq);
		
		model.addAttribute("break_result", break_result);
		return "clubList/clubList";
	}
	
	 //동호회 해체 시키기 (관리자)
	@RequestMapping("breakClubAdmin")
	@ResponseBody
	public int breakClub(int board_seq) throws Exception{
		int break_result = csService.breakClub(board_seq);
	
		return break_result;
	 }
	
	// 동호회 가입 요청 취소하기
	@RequestMapping("joinCencel")
	public String joinCencel(int cs_board_seq, String cs_join_id) throws Exception {

		int cencelResult = csService.joinCencel(cs_join_id, cs_board_seq);
		
		return "redirect:/clubHouse?cl_id=" + cs_board_seq;
	}
	

}
