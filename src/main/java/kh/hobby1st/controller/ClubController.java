package kh.hobby1st.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hobby1st.dto.ClubJoinStateDTO;
import kh.hobby1st.service.ClubJoinStateService;

@Controller
@RequestMapping("/club/")
public class ClubController {

	@Autowired
	private HttpSession session;

	@Autowired
	private ClubJoinStateService csService;

	// 동호회 가입 요청
	@RequestMapping("requestJoin")
	public String requestJoin(ClubJoinStateDTO dto) throws Exception {

		int result = csService.requestJoin(dto);

		return "a";
	}

	// 동호회 가입 요청 승인
	@RequestMapping("joinApprove")
	public String joinApprove(ClubJoinStateDTO dto) throws Exception {

		System.out.println("승인");

		return "a";
	}

	// 동호회 가입 요청 거절
	@RequestMapping("joinRefuse")
	public String joinRefuse(ClubJoinStateDTO dto) throws Exception {

		System.out.println("거절");

		return "a";
	}

}
