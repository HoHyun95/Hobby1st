package kh.hobby1st.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kh.hobby1st.dao.ClubBoardDAO;
import kh.hobby1st.dto.ClubBoardDTO;
import kh.hobby1st.dto.ClubBoardReplyDTO;
import kh.hobby1st.dto.ClubListDTO;
import kh.hobby1st.service.ClubBoardReplyService;
import kh.hobby1st.service.ClubBoardService;
import kh.hobby1st.service.ClubListService;

@Controller
@RequestMapping("/clubBoard/")
public class ClubBoardController {

	@Autowired
	private HttpSession session;

	@Autowired
	private ClubBoardDAO dao;

	@Autowired
	private ClubBoardService club_board_service;

	@Autowired
	private ClubBoardReplyService club_board_reply_service;
	
	@Autowired
	private ClubListService club_list_service;
	
	
	Gson g = new Gson();

	@RequestMapping("/boardList")
	public String memberList(int cpage,int cb_club_id, Model model) throws Exception {
		List<ClubBoardDTO> clubBoardList = club_board_service.selectBoardByPaging(cpage, cb_club_id);

		int check_num = 1;
		String navi = club_board_service.getPageNavi(cpage, cb_club_id);
		int totalBoardCount = club_board_service.getRecordCount(cb_club_id);

		model.addAttribute("totalBoardCount", totalBoardCount);
		model.addAttribute("check_num", check_num);
		model.addAttribute("cpage", cpage);
		model.addAttribute("navi", navi);
		model.addAttribute("clubBoardList", clubBoardList);
		model.addAttribute("cb_club_id", cb_club_id);

		return "clubBoard/boardList";
	}

//	게시판 작성 페이지 이동
	@RequestMapping("/boardWrite")
	public String boardWrite(Model model, int cb_club_id) {
		
		model.addAttribute("cb_club_id", cb_club_id);
		return "clubBoard/boardWrite";
	}

	// 게시판 작성
	@RequestMapping("/boardInsert")
	public String boardInsert(ClubBoardDTO dto, Model model, int cb_club_id) {
		dto.setCb_club_id(cb_club_id);
		dto.setCb_writer((String) session.getAttribute("mem_id"));
		dto.setCb_nickname((String) session.getAttribute("user_nickName"));

		club_board_service.insert(dto);
		int totalBoardCount = club_board_service.getRecordCount(cb_club_id);

		return "redirect:/clubBoard/boardList?cpage=1&totalBoardNum=5&cb_club_id=" + cb_club_id;
	}

	// 게시판 상세페이지 이동
	@RequestMapping("/boardDetail")
	public String boardDetail(int cb_seq, int cpage, Model model, int check_num, String keyword, String searchWord, int cb_club_id) {

		if (keyword.equals("title")) {
			keyword = "제목";
		} else if (keyword.equals("writer")) {
			keyword = "작성자";
		}
		String rec_id = (String) session.getAttribute("mem_id");
		int check = club_board_service.checkRec(cb_seq, rec_id);
		int user = 0;
		if(check ==1){
			user = 0;
		} else if(check == 0) {
			user = 1;
		}
		String writerProfile = club_board_service.writerProfile(cb_seq);
		
		System.out.println("숫자 " + cb_club_id);
		
//		ClubListDTO list = club_list_service.selectClub("54");
//		
//		System.out.println("리스트" + list.getCl_photo());
		
		ClubBoardDTO detail = club_board_service.boardDetail(cb_seq);
		club_board_service.increaseView(cb_seq);
		List<ClubBoardReplyDTO> replyList = club_board_reply_service.selectReply(cb_seq);
		int replycount = club_board_reply_service.replyCount(cb_seq);
		List<String> reply_profile = club_board_service.reply_profile(cb_seq);
		
		System.out.println(reply_profile.size());

//		model.addAttribute("list", list.getCl_photo());
		model.addAttribute("writerProfile", writerProfile);
		model.addAttribute("reply_profile", reply_profile);
		model.addAttribute("keyword", keyword);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("replycount", replycount);
		model.addAttribute("check_num", check_num);
		model.addAttribute("user", user); 
		model.addAttribute("cpage", cpage); 
		model.addAttribute("replyList", replyList);
		model.addAttribute("detail", detail);
		model.addAttribute("cb_club_id", cb_club_id);
		return "clubBoard/boardDetail";
	}

	// 댓글 작성
	@RequestMapping("/insertReply")
	public String insertReply(ClubBoardReplyDTO dto, int cb_seq, int cpage, int check_num, String keyword,
			String searchWord, int cb_club_id) {

		if (keyword.equals("제목")) {
			keyword = "title";
		} else if (keyword.equals("작성자")) {
			keyword = "writer";
		}

		dto.setCbr_writer((String) session.getAttribute("mem_id"));
		dto.setCbr_nickname((String) session.getAttribute("user_nickName"));
		dto.setCbr_par_seq(cb_seq);

		club_board_reply_service.plusReply(cb_seq);
		int result = club_board_reply_service.insert(dto);

		return "redirect:/clubBoard/boardDetail?cpage=" + cpage + "&cb_seq=" + cb_seq + "&keyword=" + keyword
				+ "&searchWord=" + searchWord + "&check_num=" + check_num + "&cb_club_id=" + cb_club_id;
	}

	// 댓글 삭제
	@RequestMapping("/deleteReply")
	public String deleteReply(int cbr_seq, int cb_seq, int cpage, int check_num, String keyword, String searchWord, int cb_club_id) {

		if (keyword.equals("제목")) {
			keyword = "title";
		} else if (keyword.equals("작성자")) {
			keyword = "writer";
		}

		club_board_reply_service.minusReply(cb_seq);
		int result = club_board_reply_service.deleteReply(cbr_seq);

		return "redirect:/clubBoard/boardDetail?cpage=" + cpage + "&cb_seq=" + cb_seq + "&keyword=" + keyword
				+ "&searchWord=" + searchWord + "&check_num=" + check_num + "&cb_club_id=" + cb_club_id;
	}
	
	// 대댓글 작성
		@RequestMapping("/insertReply_rec")
		public String insertReply_rec(ClubBoardReplyDTO dto, int cb_seq, int cpage, int check_num, String keyword,
				String searchWord, int cbr_seq, int cb_club_id) {

			if (keyword.equals("제목")) {
				keyword = "title";
			} else if (keyword.equals("작성자")) {
				keyword = "writer";
			}
			
			dto.setCbr_writer((String) session.getAttribute("mem_id"));
			dto.setCbr_nickname((String) session.getAttribute("user_nickName"));
			dto.setCbr_par_seq(cb_seq);

			club_board_reply_service.plusReply(cb_seq);
			int result = club_board_reply_service.insert_rec(dto);

			return "redirect:/clubBoard/boardDetail?cpage=" + cpage + "&cb_seq=" + cb_seq + "&keyword=" + keyword
					+ "&searchWord=" + searchWord + "&check_num=" + check_num + "&cb_club_id=" + cb_club_id;
		}
	
		// 대댓글 삭제
		@RequestMapping("/deleteReply_r")
		public String deleteReply_r(int cbr_r_seq, int cb_seq, int cpage, int check_num, String keyword, String searchWord, int cb_club_id) {

			if (keyword.equals("제목")) {
				keyword = "title";
			} else if (keyword.equals("작성자")) {
				keyword = "writer";
			}

			club_board_reply_service.minusReply(cb_seq);
			int result = club_board_reply_service.deleteReply_r(cbr_r_seq);

			return "redirect:/clubBoard/boardDetail?cpage=" + cpage + "&cb_seq=" + cb_seq + "&keyword=" + keyword
					+ "&searchWord=" + searchWord + "&check_num=" + check_num + "&cb_club_id=" + cb_club_id;
		}
	
	

	// 게시판 삭제
	@RequestMapping("/deleteBoard")
	public String deleteBoard(int cpage, int cb_seq, int cb_club_id) {

		int result = club_board_service.deleteBoard(cb_seq);
		
		return "redirect:/clubBoard/boardList?cpage=" + cpage + "&cb_club_id=" + cb_club_id;
	}
	
	// 게시글 삭제 관리자 페이지에서 삭제 
	@RequestMapping("/deleteBoardAdmin")
	@ResponseBody
	public int deleteBoard(int cb_seq) {
		
	int result = club_board_service.deleteBoard(cb_seq);
		
		return result;
	}
	

	// 게시판 수정페이지 이동
	@RequestMapping("/modifyBoard")
	public String modifyBoard(int cpage, int cb_seq, Model model, int check_num, String keyword, String searchWord, int cb_club_id) {
		ClubBoardDTO detail = club_board_service.boardDetail(cb_seq);

		model.addAttribute("keyword", keyword);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("check_num", check_num);
		model.addAttribute("cpage", cpage);
		model.addAttribute("detail", detail);
		model.addAttribute("cb_club_id", cb_club_id);
		return "clubBoard/modify_boardWrite";
	}

	// 게시판 수정페이지 수정
	@RequestMapping("/updateBoard")
	public String updateBoard(int cpage, Model model, ClubBoardDTO dto, int check_num, String keyword,
			String searchWord, int cb_club_id) {

		if (keyword.equals("제목")) {
			keyword = "title";
		} else if (keyword.equals("작성자")) {
			keyword = "writer";
		}

		int result = club_board_service.modifyBoard(dto);

		model.addAttribute("result", result);

		return "redirect:/clubBoard/boardDetail?cpage=" + cpage + "&cb_seq=" + dto.getCb_seq() + "&keyword=" + keyword
				+ "&searchWord=" + searchWord + "&check_num=" + check_num + "&cb_club_id=" + cb_club_id;
	}

	// 게시판 검색 기능
	@RequestMapping("/searchBoard")
	public String searchBoard(int cpage, String keyword, String searchWord, Model model, int cb_club_id) throws Exception {
		int check_num = 2;
		System.out.println(keyword + searchWord);
		List<ClubBoardDTO> clubBoardList = club_board_service.selectBoardSearchByPaging(cpage, cb_club_id, keyword, searchWord);
		List<ClubBoardDTO> list = dao.selectBoardSearchByPaging(1, 10, cb_club_id, keyword, searchWord);

		String navi = club_board_service.getSearchPageNavi(cpage, cb_club_id, keyword, searchWord);

		int totalBoardCount = club_board_service.getRecordSearchCount(cb_club_id, keyword, searchWord);

		model.addAttribute("keyword", keyword);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("totalBoardCount", totalBoardCount);
		model.addAttribute("check_num", check_num);
		model.addAttribute("cpage", cpage);
		model.addAttribute("navi", navi);
		model.addAttribute("clubBoardList", clubBoardList);

		return "clubBoard/boardList";
	}

	// 썸머노트 이미지 업로드
	@ResponseBody
	@RequestMapping(value = "/imageUpload", produces = "application/json; charset=UTF-8")
	public String imageUpload(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) {
		System.out.println("성공");
		JsonObject jsonObject = new JsonObject();

		/*
		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		 */

		// 내부경로로 저장
//		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String contextRoot = "/usr/local/tomcat8/apache-tomcat-8.5.73/webapps/upload";
		System.out.println(contextRoot);
//		String fileRoot = contextRoot + "resources/images/";
		String fileRoot = contextRoot + "/summernote/";

		String originalFileName = multipartFile.getOriginalFilename(); // 오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
		String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명

		File targetFile = new File(fileRoot + savedFileName);
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
//			jsonObject.addProperty("url", "/resources/images/" + savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("url", "/upload/summernote/" + savedFileName);
			jsonObject.addProperty("responseCode", "success");

		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile); // 저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;

	}

	// 게시판 추천 기능
	@ResponseBody
	@RequestMapping("/clubBoardRec")
	public String clubBoardRec(int cb_seq) throws Exception {
		
		String rec_id = (String) session.getAttribute("mem_id");
		
		int checkRec = club_board_service.clubRecommend(cb_seq, rec_id);
		
		int num = club_board_service.recCount(cb_seq);
		
		int[] arr = new int[2];
		arr[0] = num; // 추천수
		arr[1] = checkRec; // 추천 유무
		
		return g.toJson(arr);
	}

}
