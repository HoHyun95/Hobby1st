package kh.hobby1st.controller;


import java.io.File;
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
import kh.hobby1st.dto.MemberDTO;
import kh.hobby1st.service.ClubListService;
import kh.hobby1st.service.ClubList_PhotoService;
import kh.hobby1st.service.MemberService;

@Controller
@RequestMapping("/clubList/")
public class ClubListController {

	@Autowired
	private ClubListService clService;

	@Autowired
	private ClubList_PhotoService clpService;
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private HttpSession session;

	@RequestMapping("createClubPage")
	public String createClub(Model model) {
		System.out.println("동호회 만드는 임시 페이지 ");
	
		String mem_ID = (String)session.getAttribute("mem_id");

		// 대표자 이름에 들어갈 멤버 불러온다.
		List<MemberDTO> member = mService.getNameForCreateClub(mem_ID);
		model.addAttribute("member", member);

		
		System.out.println("성공 ");
		System.out.println(member);
		return "clubList/createClub";
	}

	@RequestMapping("clubListPage")
	public String clubListPage(Model model) {
		System.out.println(" 클럽 리스트 페이지  ");


		//동호회 리스트 + 동호회 사진 
		List<Map<String, Object>> map = clService.selectAll();

		System.out.println(map.size());
		System.out.println(map);
		System.out.println(map.get(0));

		//동호회 출력 
		model.addAttribute("list", map);
		return "clubList/clubList";
	}

	@RequestMapping("searchClub")
	public String searchClub(String searchField, String searchText, Model model) {

		System.out.println(" 검색필드 :" +searchField);
		
		List<ClubListDTO> searchList = clService.searchClub(searchField, searchText);			

			//검색 결과 없을 때 
			int noResult = 0;

			if(searchList.size() == 0) {
				System.out.println("검색결과 없음");
				model.addAttribute("noResult", noResult);
			}else {
				System.out.println("검색결과 존재함");
				model.addAttribute("searchList", searchList);
			}
		
		return "clubList/searchClub";
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