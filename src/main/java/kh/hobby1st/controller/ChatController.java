package kh.hobby1st.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.hobby1st.dto.ChatDTO;
import kh.hobby1st.dto.MemberDTO;
import kh.hobby1st.service.ChatService;
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

	@Autowired
	private ChatService chatService;

	private void renewalChat(ChatDTO dto, Model model) {

		// 어느 동호회의 채팅인지 알기위해 동호회 번호 가져온다. 
		String cl_id = "35";
		// 상세 동호회의 채팅이므로, 동호회 ID 가져와서 해당 동호회의 채팅인 것을 알려야한다.


		String user_name = (String)session.getAttribute("user_name");
		String mem_id =(String)session.getAttribute("mem_id");
		model.addAttribute("user_name", user_name);

		List<Map<String, Object>> map = clService.selectClub(cl_id);	
		model.addAttribute("clubInfo", map);

		// 로그인 멤버 정보
		List<MemberDTO> memberInfo = mem_service.getNameForCreateClub(mem_id);
		// Login ID 를 통해 로그인한 멤버의 정보를 가져온다.
		model.addAttribute("member", memberInfo);

		//		chatService.insertChatIntoDB(dto);

		List<ChatDTO> chatList = chatService.chatSelectAll();
		model.addAttribute("chatList", chatList);
	}

	@RequestMapping("/clubChat")
	public String moveClubChat(ChatDTO dto, Model model) {


		renewalChat(dto, model);

		return "/TempChat/chatTemp";
	}


	// 메세지 전송 값 저장
	@RequestMapping("insertChatIntoDB")
	@ResponseBody
	public int insertChatIntoDB(ChatDTO dto, Model model) {
		int chatInsertReturn = chatService.insertChatIntoDB(dto);
		renewalChat(dto, model);
		return chatInsertReturn;

	}



}
