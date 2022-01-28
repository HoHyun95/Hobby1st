package kh.hobby1st.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hobby1st.service.VoteService;

@Controller
@RequestMapping("/vote/")
public class VoteController {
	
	@Autowired
	private HttpSession session;

	@Autowired
	private VoteService voteService;
	
	
	// 투표 작성 페이지 이동
	@RequestMapping("writePage")
	public String voteWrite() {
		return "vote/voteWrite";
	}
	
	// 투표 작성 하기
	
	
	
}
