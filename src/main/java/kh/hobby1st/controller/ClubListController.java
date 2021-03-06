
package kh.hobby1st.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kh.hobby1st.dto.ClubListDTO;
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

	Gson g = new Gson();
	
	// 클럽 정보 수정 페이지 
	@RequestMapping("modifyClubPage")
	public String modifyClubPage(int cl_id, Model model) {
		
		List<ClubListDTO> clubInfo = clService.modifyClubPage(cl_id);
		model.addAttribute("club", clubInfo);
		
		return "clubList/modifyClub";
	}
	
	// 클럽 정보 수정
	@RequestMapping("modifyClubProc")
	public String modifyClub(ClubListDTO dto, MultipartFile file) throws Exception {

		String realPath = "/usr/local/tomcat8/apache-tomcat-8.5.73/webapps/upload/club";
		File realPathFile = new File(realPath);
		if (!realPathFile.exists()) {
			realPathFile.mkdir();
		}
		if (!file.isEmpty()) {
			String photoName = file.getOriginalFilename();
			file.transferTo(new File(realPath + "/" + photoName));
			dto.setCl_photo("/upload/club/" + photoName);
			int result = clService.modifyClubProc(dto);
		}
		return "redirect:/clubHouse?cl_id="+dto.getCl_id();

	}

	@RequestMapping("clubListPage")
	public String clubListPage(Model model) {
		System.out.println(" 클럽 리스트 페이지  ");

		// 동호회 리스트 + 동호회 사진
		List<ClubListDTO> map = clService.selectAll();

		// 더보기 클릭시 동호회 10 개씩 가져오기
		List<ClubListDTO> splitList = clService.selectSplit(1, 10); // start, end 값 넣어야함

		// 동호회 출력
		model.addAttribute("list", map);
		model.addAttribute("splitList", splitList);

		return "clubList/clubList";
	}

	@RequestMapping("createClubProc")
	public String createClub(ClubListDTO dto, MultipartFile file) throws Exception {

		String realPath = "/usr/local/tomcat8/apache-tomcat-8.5.73/webapps/upload/club";

		File realPathFile = new File(realPath);

		if (!realPathFile.exists()) {
			realPathFile.mkdir();
		}

		if (!file.isEmpty()) {

			String photoName = file.getOriginalFilename();
			System.out.println(photoName);

			file.transferTo(new File(realPath + "/" + photoName));
			dto.setCl_photo("/upload/club/" + photoName);
			int result = clService.createClub(dto);
			System.out.println(result);
		}
		return "redirect:/";

	}

	@ResponseBody
	@RequestMapping(value = "searchClub", produces = "application/json; charset=UTF-8")
	public String searchClub(String searchField, String searchText, Model model) {

		List<ClubListDTO> searchList = clService.searchClub(searchField, searchText);
		String result = g.toJson(searchList);
		model.addAttribute("searchList", searchList);

		return result;
	}

	@ResponseBody
	@RequestMapping("nameCheck")
	public int nameCheck(String cl_name) {
		int result = clService.nameCheck(cl_name);
		return result;
	}

	// 동호회 추천 기능
	@ResponseBody
	@RequestMapping("/clubBoardRec")
	public String clubBoardRec(int cl_id) throws Exception {

		String rec_id = (String) session.getAttribute("mem_id");

		int checkRec = clService.clubRecommend(cl_id, rec_id);

		int num = clService.recCount(cl_id);

		int[] arr = new int[2];
		arr[0] = num; // 추천수
		arr[1] = checkRec; // 추천 유무

		return g.toJson(arr);
	}

//	// 대분류 클릭시 해당 동호회 리스트 불러오기 (인원수 기준 정렬)
//	@ResponseBody
//	@RequestMapping("/ClubListByCategory")
//	public String ClubListByCategory(int cl_id) throws Exception {
//
//		String rec_id = (String) session.getAttribute("mem_id");
//
//		int checkRec = clService.clubRecommend(cl_id, rec_id);
//
//		int num = clService.recCount(cl_id);
//
//		int[] arr = new int[2];
//		arr[0] = num; // 추천수
//		arr[1] = checkRec; // 추천 유무
//
//		return g.toJson(arr);
//	}
	
	
	
	
	

	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:/";
	}

}