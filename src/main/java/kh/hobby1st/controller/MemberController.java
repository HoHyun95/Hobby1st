package kh.hobby1st.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
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

import kh.hobby1st.dto.ClubListDTO;
import kh.hobby1st.dto.MemberDTO;
import kh.hobby1st.service.ClubJoinStateService;
import kh.hobby1st.service.MemberService;
import kh.hobby1st.service.MyPageService;

@Controller
@RequestMapping("/member/")
public class MemberController {

	@Autowired
	private HttpSession session;

	@Autowired
	private JavaMailSenderImpl mailSender;

	@Autowired
	private MemberService mem_service;
	
	@Autowired
	private MyPageService myService;
	
	@Autowired
	private ClubJoinStateService csService;

	// 로그인부터 회원가입까지
	// -------------------------------------------------------------------------------------------

	// 로그인창에서 일반로그인시 발동됩니다.
	@RequestMapping("logind")
	public String logind(String mem_id, String mem_pass) {
		// 세션에 user 정보가 남아있는 경우 세션 제거
		if (session.getAttribute("mem_id") != null) {
			session.removeAttribute("mem_id");
		}

		String url = "";

		// 관리자 로그인 체크
//		if(mem_id.contains("admin")) {
//			int result = mem_service.adminLogin(mem_id, mem_pass);
//			if(result > 0) { 
//				String admin = mem_id;
//
//				session.setAttribute("admin", admin);		
//				url = "redirect: /";
//				return url;
//			}else {
//				return "error";
//			}
//		}else {

		// 회원정보 존재여부 체크
		int result = mem_service.login(mem_id, mem_pass);
		if (0 < result) {
			// 사용자 로그인 정보 session 저장

			if (mem_id.contains("admin")) {
				String admin = mem_id;
				session.setAttribute("admin", admin);
				session.setAttribute("mem_id", mem_id);
			} else {
				session.setAttribute("mem_id", mem_id);
			}
			MemberDTO mem_dto = mem_service.selectOne(mem_id);
			String user_name = mem_dto.getMem_name();
			String user_nickName = mem_dto.getMem_nickname();

			session.setAttribute("user_name", user_name);
			session.setAttribute("user_nickName", user_nickName);

			url = "redirect: /";
		} else {
			url = "error";
		}
		return url;
	}
//	}

	// 로그아웃 버튼 누를시 실행됩니다.
	@RequestMapping("logout")
	public String logout() {
		session.invalidate();
		return "redirect: /";
	}

	// 회원가입시 아이디중복 체크를 자동으로 진행합니다.(에이작스)
	// signUp에 mem_id 값을 가져와서 mem_id_Result에 중복여부 전달
	@ResponseBody
	@RequestMapping(value = "idCheck")
	public String id_check(String id) {
		int result = (Integer) mem_service.id_check(id);
		return String.valueOf(result);
	}

	// 회원가입 성공
	// SignUp Jsp에 form 형식 만 추가하면 됨
	@RequestMapping("signUp")
	public String signUp(String mem_id, String mem_pass, String mem_name, String mem_nickname, String mem_birthday,
			String mem_gender, String mem_address, String mem_category_1, String mem_category_2, String mem_phone,
			String mem_email, MultipartFile[] mem_photo) throws Exception {

		// DB에 디폴트 값을 전달하기 위해 임의 설정
		String mem_lastlogin = "default";
		String profile = "";
		for (MultipartFile mf : mem_photo) {
			if (mf.getOriginalFilename().isEmpty()) {
				if (mem_gender.equals("M")) {
					profile = "/upload/profile/man1.png";
				} else if (mem_gender.equals("F")) {
					profile = "/upload/profile/woman1.png";
				}
			} else {
				// 서버 저장주소
				String realPath = "/usr/local/tomcat8/apache-tomcat-8.5.73/webapps/upload/profile";
				File realPathFile = new File(realPath);
				if (!realPathFile.exists()) {
					realPathFile.mkdir();
				}

				String oriName = mf.getOriginalFilename();
				String sysName = UUID.randomUUID() + "_" + oriName;

				mf.transferTo(new File(realPath + "/" + sysName));
				profile = "/upload/profile/" + sysName;
			}
			int result = mem_service
					.insert(new MemberDTO(mem_id, mem_pass, mem_name, mem_nickname, mem_birthday, mem_gender,
							mem_address, mem_category_1, mem_category_2, profile, mem_lastlogin, mem_phone, mem_email));
		}
		return "redirect: /";
	}

	// 이메일찾기 기능
	// -------------------------------------------------------------------------------------------
	// 이메일 찾기 페이지로 이동
	@RequestMapping("send_email")
	public String send_email() {
		return "member/sign_email";
	}

	// 사용자에게 이메일로 인증번호를 보냅니다!
	@RequestMapping(value = "find_email")
	public String find_email(String email, Model model) {
		// 회원정보에 사용자가 입력한 이메일이 존재하는지 확인
		int result = mem_service.email_check(email);
		if (result != 0) {
			// 인증번호 랜덤으로 뽑기
			int random_num = (int) ((Math.random() * (99999 - 10000 + 1)) + 10000);
			String num = "";
			try {
				// 사용자에게 보여질 글
				MimeMessage mail = mailSender.createMimeMessage();
				MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
				mailHelper.setFrom("nocoolboy@naver.com"); // 보내는이
				mailHelper.setTo(email); // 받는이
				mailHelper.setSubject("[하비퍼스트] 회원정보를 찾기 위해 필요한 인증번호입니다. "); // 메일 제목
				mailHelper.setText("[인증번호]" + random_num + " 입니다. <br/> " + "인증번호를 확인하여 기입해주세요.", true); // 메일내용
				mailSender.send(mail);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 리턴값은 추후 디자인 정해지면 수정
			model.addAttribute("random_num", random_num);
			return "member/sign_email";
		} else if (result == 0) {
			model.addAttribute("result", result);
			return "member/sign_email";
		}
		return "member/sign_email";
	}

	// 이메일 인증 성공시 반응할 컨트롤러
	// 디자인 결정 여부에 따라 삭제될 수도있음
	@RequestMapping("emailOk")
	public String email_test() {
		System.out.println("이메일 인증 성공!");
		return "member/sign_email";
	}

	// 관리자 페이지
	// -------------------------------------------------------------------------------------------

	// 관리자 페이지 회원 추방
	@RequestMapping("signOutAdmin")
	@ResponseBody
	public int signOut(String mem_id) {
		int result = mem_service.signOut(mem_id);
		return result;
	}

	// 자료보존
	// -------------------------------------------------------------------------------------------

	// 네이버 로그인기능
	// @RequestMapping("Naver_login")
	// public String login(String naver_id, String naver_mobile, String naver_email,
	// String naver_name, String naver_nickname, String naver_birthyear,
	// String naver_birthday, String naver_gender) {
	// // 네이버 아이디 정보가 없을 시에만 발동
	// if(naver_id != null) {
	// // 네이버 아이디가 디비에 저장되어 있는지 확인
	// int naver_result = mem_service.naver_idCheck(naver_id);
	// if(0<naver_result) {
	// // 만약에 네이버 아이디가 디비에 존재한다면 아이디정보를 홈에 세션으로 넘겨줌
	// MemberDTO mem_dto = new MemberDTO();
	// String user_name = mem_dto.getMem_name();
	// session.setAttribute("user_name", user_name);
	// session.setAttribute("mem_id", naver_id);
	// }else if(0 == naver_result) {
	// // 만약에 네이버 아이디가 디비에 존재하지 않는다면 사용자 네이버 정보를 디비에 신규저장하고 로그인 시켜줌
	// // 네이버에서 넘겨주지 않는 정보는 임의지정값으로 설정
	// String modf_mobile = naver_mobile.replaceAll("[-]", "");
	// String naver_login = "naver_login";
	// String mem_birthday = naver_birthyear + "-" + naver_birthday;
	// String mem_lastlogin = "default";
	//
	// MemberDTO dto = new MemberDTO(naver_id, naver_login, naver_name,
	// naver_nickname, mem_birthday, naver_gender,naver_login, naver_login,
	// naver_login, naver_login, mem_lastlogin, modf_mobile, naver_email);
	// int naver_Rinsert = mem_service.naver_insert(dto);
	// session.setAttribute("mem_id", naver_id);
	// }
	// }
	// return "redirect: /";
	// }

	// 회원 정보 수정
	@RequestMapping("mModify")
	public String mModify(MemberDTO dto, MultipartFile file, Model model) throws Exception {

		dto.setMem_id((String) session.getAttribute("mem_id"));

		String realPath = "/usr/local/tomcat8/apache-tomcat-8.5.73/webapps/upload/profile";

		File realPathFile = new File(realPath);

		if (!realPathFile.exists()) {
			realPathFile.mkdir();
		}

		int result = 0;

		if (!file.isEmpty()) {

			String photoName = UUID.randomUUID() + "_" + file.getOriginalFilename();
			System.out.println(photoName);

			file.transferTo(new File(realPath + "/" + photoName));
			dto.setMem_photo("/upload/profile/" + photoName);
			result = mem_service.modifyMember(dto);
		} else {
			result = mem_service.modifyMemberP(dto);
		}

		model.addAttribute("result", result);
		return "myPage/myPage";
	}

	// 회원 탈퇴
	@RequestMapping("leave")
	public String leave(Model model) {
		
		String my_id = (String) session.getAttribute("mem_id");
		
		List<ClubListDTO> clubList_make = myService.clubList_make(my_id);	// 내가 만든 동호회 리스트
		System.out.println(clubList_make.size());
		
		if(clubList_make.size() != 0) {
			for(int i = 0; i < clubList_make.size(); i++) {
				csService.breakClub(clubList_make.get(i).getCl_id());
			}
		}
		
		List<ClubListDTO> clubList_join = myService.clubList_join(my_id);	// 내가 가입한 동호회 리스트
		System.out.println(clubList_join.size());
		
		if(clubList_join.size() != 0) {
			for(int i = 0; i < clubList_join.size(); i++) {
				csService.leaveClub(my_id, clubList_join.get(i).getCl_id());
			}
		}
		
		int leaveState = csService.leaveMemberState(my_id);
		
		int leaveMember = mem_service.leaveMember(my_id);
		
		session.invalidate();
		model.addAttribute("leaveMember", leaveMember);
		return "myPage/myPage";
	}

}
