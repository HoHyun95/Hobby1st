package kh.hobby1st.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hobby1st.service.MemberService;
import kh.hobby1st.service.MypageService;

@Controller
@RequestMapping("/mypage/")
public class MypageController {

	@Autowired
	private HttpSession session;

	@Autowired
	private MypageService my_service;

	// login_page
	@RequestMapping("/")
	public String mypage() {
		return "mypage/mypage";
	}

}
