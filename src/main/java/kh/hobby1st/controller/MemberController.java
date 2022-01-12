package kh.hobby1st.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/")
public class MemberController {
   
	@Autowired
	private HttpSession session;
	
	// Navi 에서 로그인을 누르면 sign_in.jsp 로 이동
	@RequestMapping("sign_in")
	public String sign_in() {
		System.out.println("member/sign_in 입니다.");
		return "member/sign_in";
	}
	
	// 로그인 기능은 아직 안살렸습니다. 
	@RequestMapping("login")
	public String login(String login_id, String login_pass) {
		System.out.println("입력한 아이디 : " + login_id);
		System.out.println("입력한 비밀번호 : " + login_pass);
		
        session.setAttribute("login_id", login_id);
		return "redirect: /";
	}
	
	@RequestMapping("sign_up")
	public String sign_up() {
		System.out.println("sign_up 입니다.");
		return "member/sign_up";
	}
	
	@RequestMapping("logout")
	public String logout() {
		System.out.println("로그아웃입니다");
		session.invalidate();
		return "redirect: /";
	}
}
