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
import kh.hobby1st.dto.FaqDTO;
import kh.hobby1st.dto.MemberDTO;
import kh.hobby1st.dto.NoticeDTO;
import kh.hobby1st.dto.QnaDTO;
import kh.hobby1st.service.ClubBoardService;
import kh.hobby1st.service.ClubCategoryService;
import kh.hobby1st.service.ClubJoinStateService;
import kh.hobby1st.service.ClubListService;
import kh.hobby1st.service.ClubMemberService;
import kh.hobby1st.service.FaqService;
import kh.hobby1st.service.MemberService;
import kh.hobby1st.service.MyPageService;
import kh.hobby1st.service.NoticeService;
import kh.hobby1st.service.QnaService;


@Controller
public class HomeController {

	@Autowired
	private MemberService mService;

	@Autowired
	private ClubMemberService cmService;

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
	private QnaService qnaService;

	@Autowired
	private FaqService faqService;

	@Autowired
	private HttpSession session;


	@RequestMapping("/")
	public String home(Model model) throws Exception {
		String my_id = (String) session.getAttribute("mem_id");
		int memberCount = mService.totalMember();
		int clmemCount = cmService.totalClubMember();
		int clCount = clService.countClub();
		//		List<ClubListDTO> map = clService.selectAll();
		System.out.println("여기");
		List<ClubListDTO> map = clService.ClubListByCategory("개발");
		System.out.println(map.get(0).getCl_id());
		List<ClubCategoryDTO> categoryList = ccService.selectCategoryList();
		// 로그인 시 관심 동호회 리스트 가져오기
		if((String)session.getAttribute("mem_id") != null) {
			List<ClubListDTO> clubList_interest = myService.clubList_interest(my_id);	
			model.addAttribute("interestList", clubList_interest);
		}
		List<ClubListDTO> ClubListByTop5 = clService.ClubListByTop30(1, 5);
		model.addAttribute("ClubListByTop5", ClubListByTop5);
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
		int totalMember = mService.totalMember();
		int totalClub = clService.countClub();
		int newMember = mService.newMember();
		int newClub = clService.newClub();
		int lastMember = mService.lastMember();
		int lastClub = clService.lastClub();
		
		int addMember = totalMember - lastMember;
		int addClub = totalClub - lastClub;
		
		// 지난 주 요일별 회원 가입 수
		int lastMonday = mService.lastMonday();
		int lastTuesday = mService.lastTuesday();
		int lastWednesday = mService.lastWednesday();
		int lastThurseday = mService.lastThurseday();
		int lastFriday = mService.lastFriday();
		int lastSaturday = mService.lastSaturday();
		int lastSunday = mService.lastSunday();
		
		// 지난 주 요일별 동호회 개설 수
		int ClastMonday = clService.lastMonday();
		int ClastTuesday = clService.lastTuesday();
		int ClastWednesday = clService.lastWednesday();
		int ClastThurseday = clService.lastThurseday();
		int ClastFriday = clService.lastFriday();
		int ClastSaturday = clService.lastSaturday();
		int ClastSunday = clService.lastSunday();		
		
		// 지난 주 요일별 게시판 등록 수
		int BlastMonday = cbService.lastMonday();
		int BlastTuesday = cbService.lastTuesday();
		int BlastWednesday = cbService.lastWednesday();
		int BlastThurseday = cbService.lastThurseday();
		int BlastFriday = cbService.lastFriday();
		int BlastSaturday = cbService.lastSaturday();
		int BlastSunday = cbService.lastSunday();
		
		model.addAttribute("allClub", clubList);
		model.addAttribute("allBoard", boardList);
		model.addAttribute("allMember", memberList);
		model.addAttribute("allNotice", noticeList);
		model.addAttribute("totalMember",totalMember);
		model.addAttribute("totalClub", totalClub);
		model.addAttribute("newMember", newMember);
		model.addAttribute("newClub", newClub);
		model.addAttribute("addMember", addMember);
		model.addAttribute("addClub", addClub);
		
		model.addAttribute("lastMonday", lastMonday);
		model.addAttribute("lastTuesday", lastTuesday);
		model.addAttribute("lastWednesday", lastWednesday);
		model.addAttribute("lastThurseday", lastThurseday);
		model.addAttribute("lastFriday", lastFriday);
		model.addAttribute("lastSaturday", lastSaturday);
		model.addAttribute("lastSunday", lastSunday);

		model.addAttribute("ClastMonday", ClastMonday);
		model.addAttribute("ClastTuesday", ClastTuesday);
		model.addAttribute("ClastWednesday", ClastWednesday);
		model.addAttribute("ClastThurseday", ClastThurseday);
		model.addAttribute("ClastFriday", ClastFriday);
		model.addAttribute("ClastSaturday", ClastSaturday);
		model.addAttribute("ClastSunday", ClastSunday);
		
		model.addAttribute("BlastMonday", BlastMonday);
		model.addAttribute("BlastTuesday", BlastTuesday);
		model.addAttribute("BlastWednesday", BlastWednesday);
		model.addAttribute("BlastThurseday", BlastThurseday);
		model.addAttribute("BlastFriday", BlastFriday);
		model.addAttribute("BlastSaturday", BlastSaturday);
		model.addAttribute("BlastSunday", BlastSunday);
		
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
		String mem_id = (String)session.getAttribute("mem_id");
		ClubListDTO club = clService.selectClub(cl_id);
		List<MemberDTO> clubMemberInfo = cmService.clubMemberInfo(Integer.parseInt(cl_id));
        List<MemberDTO> clubBossInfomation = cmService.clubBossInfomation(Integer.parseInt(cl_id));
		if(mem_id != null) {
			List<ClubListDTO> clubList_interest = myService.clubList_interest(mem_id);
			int likeResult = 0;
			for(int i = 0; i < clubList_interest.size(); i++) {
				if(Integer.parseInt(cl_id) == clubList_interest.get(i).getCl_id()) {
					System.out.println(clubList_interest.get(i).getCl_id());
					likeResult = 1;
					break;
				} 
			}
			
			int checkMember = clService.checkMember(Integer.parseInt(cl_id), mem_id);
			//		int checkClubJoin = csService.checkClubJoin(Integer.parseInt(cl_id), mem_id);
			
			model.addAttribute("club", club);
			//		model.addAttribute("checkClubJoin", checkClubJoin);
			model.addAttribute("checkMember", checkMember);
			model.addAttribute("clubMemberInfo", clubMemberInfo);
			model.addAttribute("clubBossInfomation", clubBossInfomation);
			model.addAttribute("clubList_interest", clubList_interest);
			model.addAttribute("likeResult", likeResult);
			return "clubHouse";
		} else {
			model.addAttribute("club", club);
			model.addAttribute("clubMemberInfo", clubMemberInfo);
			return "clubHouse";
		}
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

	@ResponseBody
	@RequestMapping(value = "selectByCategory", produces = "application/json; charset=UTF-8")
	public String ClubListByCategory(String cl_category_id) {
		Gson g = new Gson();
		List<ClubListDTO> selectByCategory = clService.ClubListByCategory(cl_category_id);
		String result = g.toJson(selectByCategory);
		return result;
	}

	@RequestMapping("news")
	public String news(Model model) throws Exception {
		List<NoticeDTO> noticeList = ntService.noticeListNotPaging();
		List<FaqDTO> faqList = faqService.faqList();
		List<QnaDTO> qnaList = qnaService.selectQnaByPaging(1);

		int check_num = 1;
		String navi = qnaService.getPageNavi(1);
		int totalNoticeCount = qnaService.getRecordCount();

		model.addAttribute("totalNoticeCount", totalNoticeCount);
		model.addAttribute("check_num", check_num);
		model.addAttribute("cpage", 1);
		model.addAttribute("navi", navi);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("faqList", faqList);

		return "news";
	}

	@ResponseBody
	@RequestMapping(value = "showMore", produces = "application/json; charset=UTF-8")
	public String showMore(int start, int end) {
	  List<ClubListDTO> ClubListByTop5 = clService.ClubListByTop30(start, end);
	  Gson g = new Gson();
	  String result = g.toJson(ClubListByTop5);
	  return result;
	}

	// Interceptor Error 
	@RequestMapping("error")
	public String error() {
		return "error";
	}

	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		System.out.println("예외 처리 코드가 실행되었습니다.");
		return "error";
	}

}
