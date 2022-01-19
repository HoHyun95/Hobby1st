package kh.hobby1st.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hobby1st.dto.ClubListDTO;
import kh.hobby1st.service.MyPageService;

@Controller
@RequestMapping("/mypage/")
public class MyPageController {

	@Autowired
	private HttpSession session;

	@Autowired
	private MyPageService my_service;

	// login_page
	@RequestMapping("/")
	public String mypage(Model model) {
		
		String my_id = (String) session.getAttribute("mem_id");
	
		
		List<ClubListDTO> clubList_make = my_service.clubList_make(my_id);	// 내가 만든 동호회 리스트
		List<ClubListDTO> clubList_join = my_service.clubList_join(my_id);	// 내가 가입한 동호회 리스트
		List<ClubListDTO> clubList_interest = my_service.clubList_interest(my_id);	// 내가 관심있는 동호회 리스트
		
		
		model.addAttribute("clubList_make", clubList_make); 
		model.addAttribute("clubList_join", clubList_join);
		model.addAttribute("clubList_interest", clubList_interest);
		return "mypage/mainPage";
	}

}
