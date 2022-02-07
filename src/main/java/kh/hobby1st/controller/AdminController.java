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
	
	// 로그아웃 버튼 누를시 실행됩니다.
		@RequestMapping("/admin/logout")
		public String logout() {
			session.invalidate();
			return "redirect: /";
		}
	
	
}
