package kh.hobby1st.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kh.hobby1st.dto.ClubBoardDTO;
import kh.hobby1st.dto.ClubCategoryDTO;
import kh.hobby1st.dto.ClubListDTO;
import kh.hobby1st.dto.MemberDTO;
import kh.hobby1st.service.ClubCategoryService;
import kh.hobby1st.service.ClubJoinStateService;
import kh.hobby1st.service.ClubListService;
import kh.hobby1st.service.ClubMemberService;
import kh.hobby1st.service.MemberService;
import kh.hobby1st.service.MyPageService;


@Controller
public class HomeController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private ClubMemberService cService;
	
	@Autowired
	private ClubListService clService;
	
	@Autowired
	private MyPageService myService;
	
	@Autowired
	private ClubCategoryService ccService;
	
	@Autowired
	private ClubJoinStateService csService;
	
	@Autowired
	private HttpSession session;
	
	
	@RequestMapping("/")
	public String home(Model model) throws Exception {
		int memberCount = mService.totalMember();
		int clmemCount = cService.totalClubMember();
		int clCount = clService.countClub();
		List<ClubListDTO> map = clService.selectAll();
		List<ClubCategoryDTO> categoryList = ccService.selectCategoryList();
		
		
		model.addAttribute("list", map);
		model.addAttribute("memberCount", memberCount);
		model.addAttribute("clmemCount", clmemCount);
		model.addAttribute("clCount", clCount);
		model.addAttribute("clubCategory",categoryList);
		return "home";
	}
	
	// Fullpage 이동
	@RequestMapping("fullpage")
	public String main() {
		return "fullpage/fullpage";
	}
	
	// admin
	@RequestMapping("admin")
	public String admin() {
		return "admin/admin";
	}
	
	// myPage
	@RequestMapping("myPage")
	public String myPage(Model model) {
		if((String)session.getAttribute("mem_id") == null) {
			return "redirect:/";
		}
		String my_id = (String) session.getAttribute("mem_id");
		MemberDTO memberInfo = mService.selectOne(my_id);
		List<ClubListDTO> clubList_make = myService.clubList_make(my_id);	// 내가 만든 동호회 리스트
		List<ClubListDTO> clubList_join = myService.clubList_join(my_id);	// 내가 가입한 동호회 리스트
		List<ClubListDTO> clubList_interest = myService.clubList_interest(my_id);	// 내가 관심있는 동호회 리스트
		List<ClubBoardDTO> clubBoardList = myService.clubBoardList(my_id);
		
		List<MemberDTO> joinMemberInfo = csService.joinMemberInfo(my_id);
		List<ClubListDTO> joinClubInfo = csService.joinClubInfo(my_id);
		
		

		model.addAttribute("joinMemberInfo", joinMemberInfo);
		model.addAttribute("joinClubInfo", joinClubInfo);
		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("clubList_make", clubList_make); 
		model.addAttribute("clubList_join", clubList_join);
		model.addAttribute("clubList_interest", clubList_interest);
		model.addAttribute("clubBoardList", clubBoardList); 
		
		return "myPage/myPage";
	}
	
	// club 
	@RequestMapping("club")
	public String club(Model model) {
		List<ClubListDTO> clubList = clService.selectAll();
		
		model.addAttribute("clubList", clubList);
		return "club";
	}
	
	// club 상세페이지
	@RequestMapping("clubHouse")
	public String clubHouse(String cl_id, Model model) {
		ClubListDTO club = clService.selectClub(cl_id);
		String mem_id = (String)session.getAttribute("mem_id");
		int checkMember = clService.checkMember(Integer.parseInt(cl_id), mem_id);
		
		model.addAttribute("club", club);
		model.addAttribute("checkMember", checkMember);
		return "clubHouse";
	}
	
	@ResponseBody
	@RequestMapping(value = "splitList", produces = "application/json; charset=UTF-8")
	public String loadSplitList(int start, int end) {
		Gson g = new Gson();
		System.out.println(start);
		System.out.println(end);
		List<ClubListDTO> selectSplit = clService.selectSplit(start, end);
		String result = g.toJson(selectSplit);
		
		return result;
	}
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		System.out.println("예외 처리 코드가 실행되었습니다.");
		return "error";
	}
	
	
	
}
