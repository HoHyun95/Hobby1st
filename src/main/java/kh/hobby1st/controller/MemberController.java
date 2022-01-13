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

	//login_page
	@RequestMapping("sign_in")
	public String sign_in() {
		return "member/sign_in";
	}

	//login_click
	@RequestMapping("login")
	public String login(String mem_id, String me_pass) {
		session.setAttribute("mem_id", mem_id);
		return "redirect: /";
	}

	//logout_click
	@RequestMapping("logout")
	public String logout() {
		session.invalidate();
		return "redirect: /";
	}	

	//signUp_page
	@RequestMapping("sign_up")
	public String sign_up() {
		return "member/sign_up";
	}

	//signUp_lastPage
	@RequestMapping("sign_up_last")
	public String sign_up_last(String mem_id, String mem_pass, String mem_name, String mem_email, String mem_birthday,
			String mem_gender, String mem_category_1, String mem_category_2) {
		//다음 페이지로 사용자가 작성한 세션값을 넘김
		session.setAttribute("mem_id", mem_id);
		session.setAttribute("mem_pass", mem_pass);
		session.setAttribute("mem_name", mem_name);
		session.setAttribute("mem_email", mem_email);
		session.setAttribute("mem_birthday", mem_birthday);
		session.setAttribute("mem_gender", mem_gender);
		session.setAttribute("mem_category_1", mem_category_1);
		session.setAttribute("mem_category_2", mem_category_2);
		return "member/sign_up_last";
	}
	
	//member_add_click
	@RequestMapping("member_add")
	public String memberAdd(String mem_id, String mem_pass, String mem_name, String mem_email, String mem_birthday,
			String mem_gender, String mem_category_1, String mem_category_2) {
		return "redirect: sign_in";
	}

}
