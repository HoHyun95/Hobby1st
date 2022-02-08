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
	public String detailPage(int vl_seq, Model model) {

		String mem_id = (String) session.getAttribute("mem_id");

		VoteListDTO voteDetail = voteService.selectVoteDetail(vl_seq);
		List<VoteOptionDTO> voteOption = voteService.selectVoteOption(vl_seq);
		int voteCheck = voteService.voteCheck(vl_seq, mem_id);

		model.addAttribute("voteDetail", voteDetail);
		model.addAttribute("voteOption", voteOption);
		model.addAttribute("voteCheck", voteCheck);
		return "vote/voteDetail";
	}

	// 투표하기 (단일투표)
	@RequestMapping("voteComplete")
	public String voteComplete(int option, int vl_seq, Model model) {

		String vc_vote_id = (String) session.getAttribute("mem_id");

		int voteResult = voteService.comVote(option, vl_seq, vc_vote_id);

		model.addAttribute("vl_seq", vl_seq);
		model.addAttribute("voteResult", voteResult);
		return "vote/voteDetail";
	}
	
	// 투표하기 (중복투표)
	@RequestMapping("voteCompleteCB")
	public String voteCompleteCB(int[] option, int vl_seq, Model model) {

		String vc_vote_id = (String) session.getAttribute("mem_id");
		
		for (int i = 0; i < option.length; i++) {
			System.out.println("항목 : " + option[i]);
			voteService.icOption(option[i]);
		}
		int voteResult = voteService.icVoteRecord(vl_seq, vc_vote_id);
		
		model.addAttribute("vl_seq", vl_seq);
		model.addAttribute("voteResult", voteResult);
		return "vote/voteDetail";
	}
	
	//투표 결과 보기
	@RequestMapping("voteResultPage")
	public String voteResultPage(int vl_seq, Model model) {

		String vc_vote_id = (String) session.getAttribute("mem_id");
		VoteListDTO voteDetail = voteService.selectVoteDetail(vl_seq);
		List<VoteOptionDTO> voteOption = voteService.selectVoteOption(vl_seq);
		int voteTotalCount = voteService.voteTotalCount(vl_seq);
		List<VoteOptionDTO> optionRank = voteService.selectOptionByCount(vl_seq);
		
		int[] resultCount = new int[voteOption.size()];
		int[] resultCountM = new int[voteOption.size()];
		
		for(int i = 0; i < voteOption.size(); i++) {
			if(voteOption.get(i).getVo_count() != 0) {
				resultCount[i] = (voteOption.get(i).getVo_count() * 100) / voteTotalCount;
			}else  {
				resultCount[i] = 0;
			}
			resultCountM[i] = 100 - resultCount[i];
		}
		
		int voteCheck = voteService.voteCheck(vl_seq, vc_vote_id);
		
		
		model.addAttribute("voteDetail", voteDetail);
		model.addAttribute("voteOption", voteOption);
		model.addAttribute("resultCountM", resultCountM);
		model.addAttribute("resultCount", resultCount);
		model.addAttribute("voteCheck", voteCheck);
		model.addAttribute("optionRank", optionRank);
		return "vote/voteResult";
	}

	// 투표 리스트 이동
	@RequestMapping("previousVoteList")
	public String previousVoteList(Model model) {

		String mem_id = (String) session.getAttribute("mem_id");

		List<VoteListDTO> vote_list = voteService.selectVoteAll();
		List<VoteListDTO> voteCheckList = voteService.voteCheckList(mem_id);

		model.addAttribute("voteCheckList", voteCheckList);
		model.addAttribute("vote_list", vote_list);
		return "vote/previousVoteList";
	}
	
	// 투표 리스트 이동
	@RequestMapping("presentVoteList")
	public String presentVoteList(Model model) {
		
		String mem_id = (String) session.getAttribute("mem_id");
		
		List<VoteListDTO> vote_list = voteService.selectVoteAll();
		List<VoteListDTO> voteCheckList = voteService.voteCheckList(mem_id);
		
		model.addAttribute("voteCheckList", voteCheckList);
		model.addAttribute("vote_list", vote_list);
		return "vote/presentVoteList";
	}

	// 투표 작성 하기
	@RequestMapping("voteWrite")
	public String voteWrite(VoteListDTO listDto, VoteOptionDTO optionDto, String edateY, String edateM, String edateD,
			String[] option) {

		Date edate = Date.valueOf(edateY + "-" + edateM + "-" + edateD);
		listDto.setVl_end_date(edate);

		System.out.println(listDto.getVl_title());

		voteService.insertVoteList(listDto, edateY, edateM, edateD);

		for (int i = 0; i < option.length; i++) {
			System.out.println("항목 : " + option[i]);
			voteService.insertVoteOption(option[i]);

		}

		return "vote/voteWrite";
	}

}
