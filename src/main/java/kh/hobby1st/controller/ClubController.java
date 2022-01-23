package kh.hobby1st.controller;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hobby1st.service.ClubList_PhotoService;

@Controller
@RequestMapping("/club/")
public class ClubController {

	@Autowired
	private HttpSession session;

	@Autowired
	private ClubList_PhotoService clpService;

	@RequestMapping("requestJoin")
	public String requestJoin() throws Exception {
		
		System.out.println("여기다");
		
		return "a";
	}

}
