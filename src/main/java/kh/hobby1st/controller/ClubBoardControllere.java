package kh.hobby1st.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hobby1st.dao.ClubBoardDAO;
import kh.hobby1st.dto.ClubMemberDTO;
import kh.hobby1st.dto.MemberDTO;
import kh.hobby1st.service.ClubBoardService;

@Controller
@RequestMapping("/clubBoard/")
public class ClubBoardControllere {
	
	@Autowired
	private ClubBoardDAO dao;
	
	@Autowired
	private ClubBoardService club_member_service;
	
	@RequestMapping("/boardList")
	public String memberList(int cpage, Model model) throws Exception {
		System.out.println("성공");
		
//		List<MemberDTO> memberList = club_member_service.selectMemberByPaging(cpage, 5);
//		List<ClubMemberDTO> clubMemberList = club_member_service.selectClubMemberByPaging(cpage, 5);
//		
//		
//		String navi = club_member_service.getPageNavi2(cpage);
		
		
//		model.addAttribute("cpage", cpage);
//		model.addAttribute("navi", navi);
//		model.addAttribute("memberList", memberList);
//		model.addAttribute("clubMemberList", clubMemberList);
		
		return "clubMember/memberList";
	}

}
