package kh.hobby1st.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hobby1st.dto.MemberDTO;
import kh.hobby1st.service.ClubListService;
import kh.hobby1st.service.MemberService;

@Controller
@RequestMapping("/chat")
public class ChatController {

	@Autowired 
	private HttpSession session;
	
	@Autowired 
	private ClubListService clService;
	
	@Autowired
	private MemberService mem_service;
	
	@RequestMapping("/clubChat")
	public String moveClubChat(Model model) {
		
		
		// 어느 동호회의 채팅인지 알기위해 동호회 번호 가져온다. 
		String cl_id = "35";
		// 상세 동호회의 채팅이므로, 동호회 ID 가져와서 해당 동호회의 채팅인 것을 알려야한다.
		
		
		String user_name = (String)session.getAttribute("user_name");
		String mem_id =(String)session.getAttribute("mem_id");
		
		List<Map<String, Object>> map = clService.selectClub(cl_id);	
		model.addAttribute("clubInfo", map);
		
		// 로그인 멤버 정보
		List<MemberDTO> memberInfo = mem_service.getNameForCreateClub(mem_id);
		// Login ID 를 통해 로그인한 멤버의 정보를 가져온다.
		model.addAttribute("member", memberInfo);
		
		System.out.println("controller memName : " +memberInfo.get(0).getMem_name());
		
	
		model.addAttribute("user_name", user_name);
		
		return "/TempChat/chatTemp";
	}
	
	
}
