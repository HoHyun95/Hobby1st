package kh.hobby1st.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kh.hobby1st.dto.ChatDTO;
import kh.hobby1st.dto.ClubListDTO;
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

	Gson g = new Gson();
	
	private void renewalChat(ChatDTO dto, Model model) {

		// 어느 동호회의 채팅인지 알기위해 동호회 번호 가져온다. 
		String cl_id = "35";
		// 상세 동호회의 채팅이므로, 동호회 ID 가져와서 해당 동호회의 채팅인 것을 알려야한다.


		String user_name = (String)session.getAttribute("user_name");
		String user_id =(String)session.getAttribute("mem_id");
		model.addAttribute("user_name", user_name);
		model.addAttribute("user_id", user_id);

		ClubListDTO map = clService.selectClub(cl_id);	

		// 로그인 멤버 정보
		MemberDTO memberInfo = mem_service.selectOne(user_id);
		// Login ID 를 통해 로그인한 멤버의 정보를 가져온다.

		List<ChatDTO> chatList = chatService.chatSelectAll();
		
		// 동호회 멤버의 프로필 사진이 포함 된 채팅 전체
		List<Map<String, Object>> clubChatList = chatService.selectAll(cl_id, user_id);
		model.addAttribute("chatIncludedUserPhoto", clubChatList);
		System.out.println(clubChatList);

		model.addAttribute("member", memberInfo);
		model.addAttribute("clubInfo", map);
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


	@RequestMapping("whoIsLastChat")
	@ResponseBody
	public List<ChatDTO> whoIsLastChat() {
		List<ChatDTO> result = chatService.whoIsLastChat();
		return result;
	}
	
	@RequestMapping(value= "getUserProfile", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String getUserProfile(String mem_id) {
		String userProfile = chatService.getUserProfile(mem_id);
		return userProfile;
	}
	
//	@RequestMapping(value= "whoIsLastChat", produces = "application/text; charset=UTF-8")
//	@ResponseBody
//	public String whoIsLastChat() {
//		String result = chatService.whoIsLastChat();
//		return result;
//	}

	@RequestMapping("isThisMyChat")
	@ResponseBody
	public int isThisMyChat(String chat_writer) {
		System.out.println(chat_writer);
		int result = chatService.isThisMyChat(chat_writer);
		System.out.println("값이 있으면 내가 쓴 글(DB) null 이면 남의 글 (DB)"+result);
		
		return result;
	}
	

}
