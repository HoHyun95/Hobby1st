package kh.hobby1st.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.hobby1st.dto.MemberDTO;
import kh.hobby1st.service.MemberService;

@Controller
@RequestMapping("/member/")
public class MemberController {

	@Autowired
	private HttpSession session;

	@Autowired
	private JavaMailSenderImpl mailSender;

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

		int result = mem_service.login(mem_id, mem_pass);
		if(0<result) {

			//사용자 이름 session 저장

			MemberDTO mem_dto = mem_service.selectOne(mem_id);
			String user_name = mem_dto.getMem_name();
			
			session.setAttribute("mem_id", mem_id);
			session.setAttribute("user_name", user_name);
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

	//auto id_check
	@ResponseBody
	@RequestMapping(value="id_check")
	public String id_check(String id) {
		int result = (Integer)mem_service.id_check(id);
		return String.valueOf(result);
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

		String add_email = mem_email.replaceAll("[,]", "");
		session.setAttribute("mem_email", add_email);

		session.setAttribute("mem_address", mem_address);
		session.setAttribute("mem_birthday", mem_birthday);
		session.setAttribute("mem_gender", mem_gender);
		session.setAttribute("mem_category_1", mem_category_1);
		session.setAttribute("mem_category_2", mem_category_2);
		if(mem_category_2 == null) {
			mem_category_2 = "no_category_2";
			session.setAttribute("mem_category_2", mem_category_2);
			return "member/sign_up_last";
		}
		return "member/sign_up_last";
	}

	//member_add_click
	@RequestMapping("member_add")
	public String memberAdd(String mem_id, String mem_pass, String mem_name, String mem_nickname, String mem_birthday, String mem_gender,
			String mem_address, String mem_category_1, String mem_category_2, String mem_phone, String mem_email,  MultipartFile[] mem_photo) {

		String mem_lastlogin = "default";
		for(MultipartFile mf : mem_photo) {
			try{
				String realPath = session.getServletContext().getRealPath("upload");
				File realPathFile = new File(realPath);
				if(!realPathFile.exists()) {realPathFile.mkdir();}

				String oriName = mf.getOriginalFilename();         
				String sysName = UUID.randomUUID() + "_" + oriName;   

				mf.transferTo(new File(realPath+"/"+sysName));

				MemberDTO dto = new MemberDTO(mem_id, mem_pass, mem_name, mem_nickname, mem_birthday, mem_gender,mem_address, mem_category_1, mem_category_2, sysName, mem_lastlogin, mem_phone, mem_email); 
				int result = mem_service.insert(dto);
			} catch (Exception e) {
				e.printStackTrace();
			}	
		}
		return "redirect: sign_in";
	}



	//find-email!!
	@RequestMapping(value="find_email")
	public String find_email(String email, Model model) {
		int result = mem_service.email_check(email);

		if(result != 0) {
			int random_num = (int)((Math.random()* (99999 - 10000 + 1)) + 10000);
			String num = "";		
			try {
				MimeMessage mail = mailSender.createMimeMessage();
				MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");	        
				mailHelper.setFrom("nocoolboy@naver.com"); // 보내는이 
				mailHelper.setTo(email); // 받는이 
				mailHelper.setSubject("[하비퍼스트] 회원정보를 찾기 위해 필요한 인증번호입니다. "); // 메일 제목
				mailHelper.setText("[인증번호]" + random_num + " 입니다. <br/> "
						+ "인증번호를 확인하여 기입해주세요.", true);  //메일내용     	    
				mailSender.send(mail);
			} catch(Exception e) {
				e.printStackTrace();
			}
			model.addAttribute("random_num", random_num);
			return "member/sign_email";
		}else if(result == 0) {
			model.addAttribute("result",result);
			return "member/sign_email";
		}
		return "member/sign_email";
	}

	// email page
	@RequestMapping("send_email")
	public String send_email() {
		return "member/sign_email";
	}
	
	@RequestMapping("emailOk")
	public String email_test() {
		System.out.println("이메일 인증 성공!");
		return "member/sign_email";
	}
 }


