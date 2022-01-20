
package kh.hobby1st.controller;


import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		return "clubList/createClub";
	}

	@RequestMapping("clubListPage")
	public String clubListPage(Model model) {
		System.out.println(" 클럽 리스트 페이지  ");

		//동호회 리스트 + 동호회 사진 
		List<ClubListDTO> map = clService.selectAll();
			
		// 더보기 클릭시 동호회 10 개씩 가져오기
		List<ClubListDTO> splitList = clService.selectSplit(1,10); // start, end 값 넣어야함
		
		//동호회 출력 
		model.addAttribute("list", map);
		model.addAttribute("splitList", splitList);
		
		return "clubList/clubList";
	}
	

	@RequestMapping("createClubProc")
	public String createClub(ClubListDTO dto, MultipartFile file) throws Exception {

		System.out.println(dto.getCl_maxMem());
		System.out.println(dto.getCl_local());
		System.out.println(dto.getCl_desc());

		String realPath = session.getServletContext().getRealPath("clubPic");

		File realPathFile = new File(realPath);

		if(!realPathFile.exists()) {
			realPathFile.mkdir();
		}

		if(!file.isEmpty()) {

			String photoName = file.getOriginalFilename();
			System.out.println(photoName);

			file.transferTo(new File(realPath+"/"+photoName));
//			clpService.insertPhoto(new ClubList_PhotoDTO(0,cl_id,photoName));
			dto.setCl_photo(realPath+"/"+photoName);
			int result = clService.createClub(dto);
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