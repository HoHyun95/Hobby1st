
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
			
		System.out.println(map.size());
		System.out.println(map);
		System.out.println(map.get(0));
		
		//동호회 출력 
		model.addAttribute("list", map);
		
//		List<String> list = new ArrayList(); 
	
//		for(Map<String, Object> list : map) {
//	
//		}
		
//		for(int i = 0; i < map.size(); i++) {
//			String cl_id = map.get(i).get("CL_ID").toString();
//			String cl_name = map.get(i).get("CL_NAME").toString();
//			String cl_boss_id = map.get(i).get("CL_BOSS_ID").toString();
//			String cl_maxMem = map.get(i).get("CL_MAXMEM").toString();
//			String cl_local = map.get(i).get("CL_LOCAL").toString();
//			String cl_openDate = map.get(i).get("CL_OPENDATE").toString();
//			String cl_memCount = map.get(i).get("CL_MEMCOUNT").toString();
//			String cl_category_id = map.get(i).get("CL_CATEGORY_ID").toString();
//			String cl_dCategory_id = map.get(i).get("CL_DCATEGORY_ID").toString();
//			String clp_photo = map.get(i).get("CLP_PHOTO").toString();

			
//			list.add(i,cl_id);
//			list.add(i,cl_name);
//			list.add(i,cl_boss_id);
//			list.add(i,cl_maxMem);
//			list.add(i,cl_local);
//			list.add(i,cl_openDate);
//			list.add(i,cl_memCount);
//			list.add(i,cl_category_id);
//			list.add(i,cl_dCategory_id);
//			list.add(i,clp_photo);
	

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