package kh.hobby1st.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kh.hobby1st.dao.MemberDAO;
import kh.hobby1st.dto.MemberDTO;
import kh.hobby1st.service.MemberService;

@Controller
@RequestMapping("/member/")
public class MemberController {

	@Autowired
	private HttpSession session;

	@Autowired
	private MemberService mem_service;

	//login_page
	@RequestMapping("sign_in")
	public String sign_in() {
		return "member/sign_in";
	}

	//login_click
	@RequestMapping("login")
	public String login(String mem_id, String mem_pass) {
		int result = (Integer)mem_service.login(mem_id, mem_pass);
        if(0<result) {
    		session.setAttribute("mem_id", mem_id);
        }
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
	public String sign_up_last(String mem_id, String mem_pass, String mem_name, String mem_nickname, String mem_birthday, String mem_gender,
			String mem_address, String mem_category_1, String mem_category_2, String mem_phone, String mem_email) {
		//값을 가져오기 위한 것 
		session.setAttribute("mem_id", mem_id);
		session.setAttribute("mem_pass", mem_pass);
		session.setAttribute("mem_name", mem_name);
		session.setAttribute("mem_phone", mem_phone);
		session.setAttribute("mem_email", mem_email);
		session.setAttribute("mem_address", mem_address);
		session.setAttribute("mem_birthday", mem_birthday);
		session.setAttribute("mem_gender", mem_gender);
		session.setAttribute("mem_category_1", mem_category_1);
		session.setAttribute("mem_category_2", mem_category_2);
		return "member/sign_up_last";
	}

	//member_add_click
	@RequestMapping("member_add")
	public String memberAdd(String mem_id, String mem_pass, String mem_name, String mem_nickname, String mem_birthday, String mem_gender,
			String mem_address, String mem_category_1, String mem_category_2, String mem_phone, String mem_email,  MultipartFile[] mem_photo) {
		
		String mem_lastlogin = "default";
		
		Date Date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(mem_birthday);
		String formattedDate = simpleDateFormat.format(Date);
		java.sql.Date sqldate = java.sql.Date.valueOf(formattedDate);
		
		
		for(MultipartFile mf : mem_photo) {
			try{
				String realPath = session.getServletContext().getRealPath("upload");
				File realPathFile = new File(realPath);
				if(!realPathFile.exists()) {realPathFile.mkdir();}

				String oriName = mf.getOriginalFilename();         
				String sysName = UUID.randomUUID() + "_" + oriName;   

				mf.transferTo(new File(realPath+"/"+sysName));

				MemberDTO dto = new MemberDTO(mem_id, mem_pass, mem_name, mem_nickname, mem_birthday, mem_gender, 
				int result = mem_service.insert(dto);

			} catch (Exception e) {
				e.printStackTrace();
			}	
		}
		return "redirect: sign_in";
	}
}


