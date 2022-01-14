
package kh.hobby1st.controller;


import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.hobby1st.dto.ClubListDTO;
import kh.hobby1st.dto.ClubList_PhotoDTO;
import kh.hobby1st.service.ClubListService;
import kh.hobby1st.service.ClubList_PhotoService;

@Controller
@RequestMapping("/clubList/")
public class ClubListController {

	@Autowired
	private ClubListService clService;

	@Autowired
	private ClubList_PhotoService clpService;

	@Autowired
	private HttpSession session;

	@RequestMapping("createClubPage")
	public String createClub() {
		System.out.println("동호회 만드는 임시 페이지 ");
		return "clubList/createClub";
	}

	@RequestMapping("createClubProc")
	public String createClub(ClubListDTO dto, MultipartFile file) throws Exception {
		
		int cl_id = clService.createClub(dto);

	
		String realPath = session.getServletContext().getRealPath("clubPic");

		File realPathFile = new File(realPath);

		if(!realPathFile.exists()) {
			realPathFile.mkdir();
		}

		if(!file.isEmpty()) {
		
			String photoName = file.getOriginalFilename();
			System.out.println(photoName);
		
			file.transferTo(new File(realPath+"/"+photoName));
			clpService.insertPhoto(new ClubList_PhotoDTO(0,cl_id,photoName));
			System.out.println("3");
		}
		return "redirect:/";
	}

	@ResponseBody
	@RequestMapping("nameCheck")
	public int nameCheck(String cl_name) {
		int result = clService.nameCheck(cl_name);
		System.out.println(result);
		return result;
	}



	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:/";
	}

}