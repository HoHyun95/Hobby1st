package kh.hobby1st.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/chat")
public class ChatController {

	@Autowired 
	private HttpSession session;
	
	@RequestMapping("/clubChat")
	public String moveClubChat() {
		return "/TempChat/chatTemp";
	}
	
}
