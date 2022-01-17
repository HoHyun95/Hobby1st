package kh.hobby1st.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hobby1st.service.ClubListService;
import kh.hobby1st.service.ClubMemberService;
import kh.hobby1st.service.MemberService;


@Controller
public class HomeController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private ClubMemberService cService;
	
	@Autowired
	private ClubListService clService;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/")
	public String home(Model model) throws Exception {
		int memberCount = mService.totalMember();
		int clmemCount = cService.totalClubMember();
		int clCount = clService.countClub();
		List<Map<String, Object>> map = clService.selectAll();

		model.addAttribute("list", map);
		model.addAttribute("memberCount", memberCount);
		model.addAttribute("clmemCount", clmemCount);
		model.addAttribute("clCount", clCount);
		return "home";
	}
	// 메인페이지 이동
	@RequestMapping("fullpage")
	public String main() {
		return "fullpage/fullpage";
	}
	
	// MyPage
	@RequestMapping("myPage")
	public String myPage() {
		if((String)session.getAttribute("mem_id") == null) {
			return "redirect:/";
		}
		return "myPage";
	}
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		System.out.println("예외 처리 코드가 실행되었습니다.");
		return "redirect:/";
	}
}
