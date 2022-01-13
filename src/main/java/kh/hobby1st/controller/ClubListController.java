
package kh.hobby1st.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.hobby1st.dto.ClubListDTO;
import kh.hobby1st.service.ClubListService;

@Controller
@RequestMapping("/clubList/")
public class ClubListController {

	@Autowired
	private ClubListService service;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("createClubPage")
	public String createClub() {
		System.out.println("동호회 만드는 임시 페이지 ");
		return "clubList/createClub";
	}
	
	@RequestMapping("createClubProc")
	public String createClub(ClubListDTO dto) throws Exception {
//		String realPath = session.getServletContext().getRealPath("clubPic");
//		
//		File realPathFile = new File(realPath);
//		
//		if(!realPathFile.exists()) {
//			realPathFile.mkdir();
//		}
//		
//		String clPhoto = cl_photo.getOriginalFilename();
//		cl_photo.transferTo(new File(realPath+"/"+clPhoto));
		

		int result = service.createClub(dto);
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping("nameCheck")
	public int nameCheck(String cl_name) {
		int result = service.nameCheck(cl_name);
		System.out.println(result);
	return result;
	}

	
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:/";
	}

}