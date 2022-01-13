package kh.hobby1st.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hobby1st.dao.ClubMemberDAO;
import kh.hobby1st.dto.ClubMemberDTO;

@Controller
@RequestMapping("/clubMember/")
public class ClubMemberController {
	
	@Autowired
	private ClubMemberDAO dao;
	
	
	@RequestMapping("/memberList")
	public String home() {
		System.out.println("성공");
		
		
		return "clubMember/memberList";
	}
	
}
