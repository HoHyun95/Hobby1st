package kh.hobby1st.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hobby1st.dto.VoteListDTO;
import kh.hobby1st.dto.VoteOptionDTO;
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
	public String writePage() {
		return "vote/voteWrite";
	}
	
	// 투표 작성 하기
	@RequestMapping("voteWrite")
	public String voteWrite(VoteListDTO listDto, VoteOptionDTO optionDto, String edateY, String edateM, String edateD, String[] option) {
		
		Date edate = Date.valueOf(edateY + "-" + edateM + "-" + edateD);
		listDto.setVl_end_date(edate);
		
		for(int i =0; i < option.length; i++) {
			System.out.println("항목 : " + option[i]);
			
		}
		
		
		System.out.println(listDto.getVl_end_date());
		System.out.println(listDto.getVl_type());
		return "vote/voteWrite";
	}
	
	
}
