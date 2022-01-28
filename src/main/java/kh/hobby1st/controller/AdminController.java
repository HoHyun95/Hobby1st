package kh.hobby1st.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hobby1st.dto.ClubBoardDTO;
import kh.hobby1st.dto.ClubListDTO;
import kh.hobby1st.dto.MemberDTO;
import kh.hobby1st.dto.NoticeDTO;
import kh.hobby1st.service.ClubBoardService;
import kh.hobby1st.service.ClubListService;
import kh.hobby1st.service.MemberService;
import kh.hobby1st.service.NoticeService;

@Controller
public class AdminController {

	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private ClubBoardService cbService;
	
	@Autowired
	private NoticeService ntService;
	
	@Autowired
	private ClubListService clService;
	
	
	
	@RequestMapping("/admin/clubAdmin")
	public String clubAdmin(Model model) {
		
		List<ClubListDTO> clubList = clService.selectAll();
		
		model.addAttribute("allClub", clubList);
		
		return "admin/clubAdmin";
	}
	
	
	@RequestMapping("/admin/boardAdmin")
	public String boardAdmin(Model model) {
		
		List<ClubBoardDTO> boardList = cbService.selectAll();
		
		model.addAttribute("allBoard", boardList);
		
		return "admin/boardAdmin";
	}
	
	@RequestMapping("/admin/memberAdmin")
	public String memberAdmin(Model model) {
		
		List<MemberDTO> memberList = mService.selectAll();
		
		model.addAttribute("allMember", memberList);
		
		return "admin/memberAdmin";
	}
	
	@RequestMapping("/admin/qaAdmin")
	public String qa(Model model) {
		return "admin/qaAdmin";
	}
	
	@RequestMapping("/admin/faqAdmin")
	public String faq(Model model) {
		return "admin/faqAdmin";
	}
	
	@RequestMapping("/admin/noticeAdmin")
	public String notice(Model model) {
		
		List<NoticeDTO> noticeList = ntService.selectAll();
		
		model.addAttribute("allNotice", noticeList);
		
		return "admin/noticeAdmin";
	}
}
