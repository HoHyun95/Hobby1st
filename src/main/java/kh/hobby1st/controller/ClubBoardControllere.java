package kh.hobby1st.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hobby1st.dao.ClubBoardDAO;
import kh.hobby1st.dto.ClubBoardDTO;
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
		
		return "clubBoard/boardList";
	}

	
//	게시글 작성 이동
	@RequestMapping("/boardWrite")
	public String boardWrite(){
		return "clubBoard/boardWrite";
	}
	
	@RequestMapping("/boardInsert")
	public String boardInsert(ClubBoardDTO dto ,Model model){
		dto.setCb_club_id(5);
		dto.setCb_writer("suhoh01");
		
		club_member_service.insert(dto);
		
		System.out.println("성공");
		
		return "clubBoard/boardWrite";
	}
	
	
	
	
	
	
	
	
	

}
