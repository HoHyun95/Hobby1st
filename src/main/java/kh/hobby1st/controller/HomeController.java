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
import kh.hobby1st.dto.ClubJoinStateDTO;
import kh.hobby1st.dto.ClubListDTO;
import kh.hobby1st.dto.MemberDTO;
import kh.hobby1st.dto.NoticeDTO;
import kh.hobby1st.service.ClubBoardService;
import kh.hobby1st.service.ClubCategoryService;
import kh.hobby1st.service.ClubJoinStateService;
import kh.hobby1st.service.ClubListService;
import kh.hobby1st.service.ClubMemberService;
import kh.hobby1st.service.MemberService;
import kh.hobby1st.service.MyPageService;
import kh.hobby1st.service.NoticeService;


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
	private ClubBoardService cbService;
	
	@Autowired
	private NoticeService ntService;
	
	@Autowired
	private HttpSession session;
	
	
	@RequestMapping("/")
	public String home(Model model) throws Exception {
		int memberCount = mService.totalMember();
		int clmemCount = cService.totalClubMember();
		int clCount = clService.countClub();
//		List<ClubListDTO> map = clService.selectAll();
		System.out.println("여기");
		List<ClubListDTO> map = clService.ClubListByCategory("개발");
		System.out.println(map.get(0).getCl_id());
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
	public String admin(Model model) {
		
		
		List<ClubListDTO> clubList = clService.selectAll();
		List<ClubBoardDTO> boardList = cbService.selectAll();
		List<MemberDTO> memberList = mService.selectAll();
		List<NoticeDTO> noticeList = ntService.selectAll();
		
		model.addAttribute("allClub", clubList);
		model.addAttribute("allBoard", boardList);
		model.addAttribute("allMember", memberList);
		model.addAttribute("allNotice", noticeList);
		
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
		
		List<MemberDTO> joinMemberInfo = csService.joinMemberInfo(my_id); // 요청한 회원 정보
		List<ClubListDTO> joinClubInfo = csService.joinClubInfo(my_id); // 요청된 동호회 정보
		
		// 1 = 날짜순
		// 2 = 상태순
		int check = 1;
		
		List<ClubListDTO> recentlyClubInfo = csService.recentlyClubInfo(my_id, check);	// 최근 활동한 동호회 정보
		List<ClubJoinStateDTO> recentlyStateInfo = csService.recentlyStateInfo(my_id, check); // 최근 활동한 상태 정보
		
//		System.out.println(recentlyClubInfo.get(0).getCl_name() + " : " + recentlyStateInfo.get(0).getCs_state());
//		System.out.println(recentlyClubInfo.get(1).getCl_name() + " : " + recentlyStateInfo.get(1).getCs_state());
//		System.out.println(recentlyClubInfo.get(2).getCl_name() + " : " + recentlyStateInfo.get(2).getCs_state());
		

		model.addAttribute("recentlyStateInfo", recentlyStateInfo);
		model.addAttribute("recentlyClubInfo", recentlyClubInfo);
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
		String mem_id = (String)session.getAttribute("mem_id");
		List<ClubListDTO> listCount = clService.selectAll();
		
		if(mem_id != null) {
			List<ClubListDTO> interestClubList = clService.interestClubList(mem_id);
			model.addAttribute("clubList", interestClubList);
			model.addAttribute("listCount", listCount);
		} else {	
			List<ClubListDTO> clubList = clService.selectSplit(1, 10);
			model.addAttribute("clubList", clubList);
			model.addAttribute("listCount", listCount);
		}
		return "club";
	}
	
	// club 상세페이지
	@RequestMapping("clubHouse")
	public String clubHouse(String cl_id, Model model) {
		ClubListDTO club = clService.selectClub(cl_id);
		String mem_id = (String)session.getAttribute("mem_id");
		int checkMember = clService.checkMember(Integer.parseInt(cl_id), mem_id);
//		int checkClubJoin = csService.checkClubJoin(Integer.parseInt(cl_id), mem_id);
		
		
		model.addAttribute("club", club);
//		model.addAttribute("checkClubJoin", checkClubJoin);
		model.addAttribute("checkMember", checkMember);
		return "clubHouse";
	}
	
	@ResponseBody
	@RequestMapping(value = "splitList", produces = "application/json; charset=UTF-8")
	public String loadSplitList(int start, int end) {
		String mem_id = (String)session.getAttribute("mem_id");
		Gson g = new Gson();
		System.out.println(start);
		System.out.println(end);
		String result;
		if(mem_id != null) {
			List<ClubListDTO> notInterestClubList = clService.notInterestClubList(mem_id, start, end);
			result = g.toJson(notInterestClubList);
		} else {
			List<ClubListDTO> selectSplit = clService.selectSplit(start, end);
			result = g.toJson(selectSplit);
		}
		return result;
	}
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		System.out.println("예외 처리 코드가 실행되었습니다.");
		return "error";
	}
	
	
	
}
