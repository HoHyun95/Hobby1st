package kh.hobby1st.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	// 투표 작성 페이지 이동
	@RequestMapping("detailPage")
	public String detailPage() {
		
		return "vote/voteDetail";
	}
	
	// 투표 리스트 이동
	@RequestMapping("listPage")
	public String listPage(Model model) {
		List<VoteListDTO> vote_list = voteService.selectVoteAll();
		
		
		model.addAttribute("vote_list", vote_list);
		return "vote/voteList";
	}
	
	// 투표 작성 하기
	@RequestMapping("voteWrite")
	public String voteWrite(VoteListDTO listDto, VoteOptionDTO optionDto, String edateY, String edateM, String edateD, String[] option) {
		
		Date edate = Date.valueOf(edateY + "-" + edateM + "-" + edateD);
		listDto.setVl_end_date(edate);
		
		System.out.println(listDto.getVl_title());
		
		voteService.insertVoteList(listDto, edateY, edateM, edateD);
		
		for(int i =0; i < option.length; i++) {
			System.out.println("항목 : " + option[i]);
			voteService.insertVoteOption(option[i]);
			
		}
		
		return "vote/voteWrite";
	}
	
	
}
