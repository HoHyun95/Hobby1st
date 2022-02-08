package kh.hobby1st.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hobby1st.dto.ClubBoardDTO;
import kh.hobby1st.dto.ClubListDTO;
import kh.hobby1st.dto.MemberDTO;
import kh.hobby1st.dto.NoticeDTO;
import kh.hobby1st.service.BoardAdminService;
import kh.hobby1st.service.ClubAdminService;
import kh.hobby1st.service.ClubBoardService;
import kh.hobby1st.service.ClubListService;
import kh.hobby1st.service.MemberAdminService;
import kh.hobby1st.service.MemberService;
import kh.hobby1st.service.NoticeAdminService;
import kh.hobby1st.service.NoticeService;

@Controller
public class AdminController {

	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private ClubBoardService cbService;
	
	@Autowired
	private NoticeService ntService;
	
	@Autowired
	private ClubListService clService;
	
	@Autowired
	private ClubAdminService aService;
	
	@Autowired
	private BoardAdminService bService;
	
	@Autowired
	private MemberAdminService maService;
	
	@Autowired
	private NoticeAdminService naService;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/admin")
	public String DashBoard(Model model) {
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
	
	@RequestMapping("/admin/clubAdmin")
	public String clubAdmin(int cpage, Model model) throws Exception{
		
//		List<ClubListDTO> clubList = clService.selectAll();
		List<ClubListDTO> adminClubList = aService.selectBoardByPaging(cpage);
		String navi = aService.getPageNavi(cpage);
		int totalListCount = aService.getRecordCount();
		
//		model.addAttribute("allClub", clubList);
		model.addAttribute("cpage",cpage);
		model.addAttribute("navi",navi);
		model.addAttribute("totalListCount", totalListCount);
		model.addAttribute("adminClubList",adminClubList);
		
		return "admin/clubAdmin";
	}
	
	
	@RequestMapping("/admin/boardAdmin")
	public String boardAdmin(int cpage, Model model) throws Exception{
		
//		List<ClubBoardDTO> boardList = cbService.selectAll();
		List<ClubBoardDTO> adminClubBoard = bService.selectBoardByPaging(cpage);
		String navi = bService.getPageNavi(cpage);
		int totalListCount = bService.getRecordCount();
		
//		model.addAttribute("allBoard", boardList);
		model.addAttribute("cpage",cpage);
		model.addAttribute("navi",navi);
		model.addAttribute("totalListCount",totalListCount);
		model.addAttribute("adminClubBoard",adminClubBoard);
		
		return "admin/boardAdmin";
	}
	
	@RequestMapping("/admin/memberAdmin")
	public String memberAdmin(int cpage, Model model) throws Exception{
		
//		List<MemberDTO> memberList = mService.selectAll();
		List<MemberDTO> adminMemberList = maService.selectBoardByPaging(cpage);
		String navi = maService.getPageNavi(cpage);
		int totalListCount = maService.getRecordCount();
		
//		model.addAttribute("allMember", memberList);
		model.addAttribute("cpage",cpage);
		model.addAttribute("adminMemberList",adminMemberList);
		model.addAttribute("navi",navi);
		model.addAttribute("totalListCount",totalListCount);
		
		
		return "admin/memberAdmin";
	}
	
	@RequestMapping("/admin/qaAdmin")
	public String qa(Model model) {
		return "admin/qaAdmin";
	}
	
	@RequestMapping("/admin/faqAdmin")
	public String faq(Model model) {
		return "admin/faqAdmin";
	}
	
	@RequestMapping("/admin/noticeAdmin")
	public String notice(int cpage, Model model) throws Exception{
		
//		List<NoticeDTO> noticeList = ntService.selectAll();
		List<NoticeDTO> noticeAllList = naService.selectBoardByPaging(cpage);
		String navi = naService.getPageNavi(cpage);
		int totalListCount = naService.getRecordCount();
		
//		model.addAttribute("allNotice", noticeList);
		
		model.addAttribute("noticeAllList",noticeAllList);
		model.addAttribute("cpage",cpage);
		model.addAttribute("navi", navi);
		model.addAttribute("totalListCount",totalListCount);
		
		return "admin/noticeAdmin";
	}
	
	@RequestMapping("/admin/voteAdmin")
	public String vote(Model model) {
		
		return "admin/voteAdmin";
	}
	
	
	// 로그아웃 버튼 누를시 실행됩니다.
		@RequestMapping("/admin/logout")
		public String logout() {
			session.invalidate();
			return "redirect: /";
		}
	
	
}
