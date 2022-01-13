package kh.hobby1st.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

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
	public String sign_up_last(String mem_id, String mem_pass, String mem_name, String mem_phone, String mem_email, String mem_birthday,
			String mem_gender, String mem_category_1, String mem_category_2) {
		//값을 가져오기 위한 것 
		session.setAttribute("mem_id", mem_id);
		session.setAttribute("mem_pass", mem_pass);
		session.setAttribute("mem_name", mem_name);
		session.setAttribute("mem_phone", mem_phone);
		session.setAttribute("mem_email", mem_email);
		session.setAttribute("mem_birthday", mem_birthday);
		session.setAttribute("mem_gender", mem_gender);
		session.setAttribute("mem_category_1", mem_category_1);
		session.setAttribute("mem_category_2", mem_category_2);
		return "member/sign_up_last";
	}
	
	//member_add_click
	@RequestMapping("member_add")
	public String memberAdd(String mem_id, String mem_pass, String mem_name, String mem_phone, String mem_email, String mem_birthday,
			String mem_gender, String mem_category_1, String mem_category_2, MultipartFile[] mem_photo) {
		
		
//		int result = BService.insert(new BoardDTO(dto.getSeq(),writer,dto.getTitle(),dto.getContents(),dto.getView_count()));
//
//		if(!file[0].isEmpty()) {  // 첫번째 파일이 비어있지 않는다면
//			for(MultipartFile mf : file) {
//				String realPath = session.getServletContext().getRealPath("upload");
//				File realPathFile = new File(realPath);
//				if(!realPathFile.exists()) {realPathFile.mkdir();}
//
//				String oriName = mf.getOriginalFilename();         // 사용자가 업로드 한 파일의 원본 이름
//				String sysName = UUID.randomUUID() + "_" + oriName;   // 서버쪽에 저장할 파일 이름 
//
//				// 서버에 업로드되어 메모리에 적재된 파일의 내용을 어디에 저장할지 결정하는 부분
//				mf.transferTo(new File(realPath+"/"+sysName));
//
//				FService.insert(new FilesDTO(0, oriName, sysName, dto.getSeq()));  // 디비에 파일을 저장 
//				System.out.println(mf.getName() + "동작확인");
//			}
//		}
//		return "redirect: list";
		
		
		
		return "redirect: sign_in";
	}

}
