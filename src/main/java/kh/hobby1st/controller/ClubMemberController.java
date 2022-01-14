package kh.hobby1st.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hobby1st.dao.ClubMemberDAO;
import kh.hobby1st.dto.ClubMemberDTO;
import kh.hobby1st.dto.MemberDTO;
import kh.hobby1st.service.ClubMemberService;

@Controller
@RequestMapping("/clubMember/")
public class ClubMemberController {
	
	@Autowired
	private ClubMemberDAO dao;
	
	@Autowired
	private ClubMemberService club_member_service;
	
	
	@RequestMapping("/memberList")
	public String memberList(int cpage, Model model) throws Exception {
		System.out.println("성공");
		
		List<MemberDTO> memberList = club_member_service.selectMemberByPaging(cpage, 5);
		List<ClubMemberDTO> clubMemberList = club_member_service.selectClubMemberByPaging(cpage, 5);
		
		
		String navi = club_member_service.getPageNavi2(cpage);
		
		
		model.addAttribute("cpage", cpage);
		model.addAttribute("navi", navi);
		model.addAttribute("memberList", memberList);
		model.addAttribute("clubMemberList", clubMemberList);
		
		return "clubMember/memberList";
	}
	
	@RequestMapping("/deleteMember")
	public String deleteMember(int cpage, String mem_id,String mem_name, Model model) throws Exception {
		
		int result = club_member_service.deleteMember(mem_id);
		
		model.addAttribute("bye_mem", mem_name);
		model.addAttribute("cpage", cpage);
		model.addAttribute("result", result);
		
		return "clubMember/memberList";
	}
	
}
