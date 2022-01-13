package kh.hobby1st.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hobby1st.dao.ClubMemberDAO;
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
		
		List<MemberDTO> list = club_member_service.selectByPaging(cpage, 5);
		String navi = club_member_service.getPageNavi2(cpage);
		
		System.out.println(navi);
		
		model.addAttribute("cpage", cpage);
		model.addAttribute("navi", navi);
		model.addAttribute("list", list);
		
		return "clubMember/memberList";
	}
	
	@RequestMapping("/deleteMember")
	public String deleteMember(int cpage, Model model) throws Exception {
		System.out.println("!!");
		
		List<MemberDTO> list = club_member_service.selectByPaging(cpage, 5);
		String navi = club_member_service.getPageNavi2(cpage);
		
		
		model.addAttribute("cpage", cpage);
		model.addAttribute("navi", navi);
		model.addAttribute("list", list);
		
		return "clubMember/memberList";
	}
	
}
