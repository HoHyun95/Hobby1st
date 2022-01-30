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
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import kh.hobby1st.dao.NoticeDAO;
import kh.hobby1st.dto.ClubBoardDTO;
import kh.hobby1st.dto.NoticeDTO;
import kh.hobby1st.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private HttpSession session;

	@Autowired
	private NoticeService notService;

	@Autowired
	private NoticeDAO dao;


	// 공지사항 전체 출력 (페이징 적용 X )
	@RequestMapping("/noticeListNotPaging")
	public String noticeListNotPaging(Model model) {
		List<NoticeDTO> noticeListNotPaging = notService.noticeListNotPaging();
		
		model.addAttribute("noticeListNotPaging", noticeListNotPaging);
		return "notice/tempNoticeNotPaging";
	}

	// 공지사항 리스트로 이동
	@RequestMapping("/noticeList")
	public String noticeList(int cpage, Model model)throws Exception {

		List<NoticeDTO> noticeList = notService.selectNoticeAll(cpage);

		int check_num = 1;
		String navi = notService.getPageNavi(cpage);
		int totalNoticeCount = notService.getRecordCount();

		model.addAttribute("totalNoticeCount", totalNoticeCount);
		model.addAttribute("check_num", check_num);
		model.addAttribute("cpage", cpage);
		model.addAttribute("navi", navi);
		model.addAttribute("noticeList", noticeList);

		return "notice/noticeList";
	}

	// 공지사항 작성 페이지 이동 
	@RequestMapping("/noticeWrite")
	public String noticeWrite() {
		return "notice/noticeWrite";
	}

	// 공지사항 작성
	@RequestMapping("/noticeInsert")
	public String noticeInsert(NoticeDTO dto) {

		dto.setNotice_writer((String) session.getAttribute("mem_id"));
		notService.insert(dto);

		return "redirect:/notice/noticeList?cpage=1";
	}


	// 공지사항 상세페이지 이동
	@RequestMapping("/noticeDetail")
	public String noticeDetail(int notice_seq, int cpage, Model model, int check_num, String keyword, String searchWord) {

		if (keyword.equals("title")) {
			keyword = "제목";
		} else if (keyword.equals("writer")) {
			keyword = "작성자";
		}
		String rec_id = (String) session.getAttribute("mem_id");

		String writerProfile = notService.writerProfile(notice_seq);

		NoticeDTO detail = notService.noticeDetail(notice_seq);
		notService.increaseView(notice_seq);
		//			

		model.addAttribute("writerProfile", writerProfile);
		model.addAttribute("keyword", keyword);
		model.addAttribute("searchWord", searchWord);
		//			model.addAttribute("replycount", replycount);
		model.addAttribute("check_num", check_num);
		//			model.addAttribute("user", user); 
		model.addAttribute("cpage", cpage); 
		//			model.addAttribute("replyList", replyList);
		model.addAttribute("detail", detail);
		return "notice/noticeDetail";
	}

	// 공지사항 삭제
	@RequestMapping("/deleteNotice")
	public String deleteNotice(int cpage, int notice_seq) {
		
		int result = notService.deleteNotice(notice_seq);
		
		return "redirect:/notice/noticeList?cpage=" + cpage;
		
	}
	
	// 공지사항 삭제 (관리자 페이지) 
	@RequestMapping("/deleteNoticeAdmin")
	@ResponseBody
	public int deleteNotice(int notice_seq) {
		
		int result = notService.deleteNotice(notice_seq);
		
		return result; 
		
	}


	// 공지사항 수정페이지 이동
	@RequestMapping("/modifyNotice")
	public String modifyBoard(int cpage, int notice_seq, Model model, int check_num, String keyword, String searchWord) {
		NoticeDTO detail = notService.noticeDetail(notice_seq);

		model.addAttribute("keyword", keyword);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("check_num", check_num);
		model.addAttribute("cpage", cpage);
		model.addAttribute("detail", detail);
		return "notice/modify_noticeWrite";
	}

	// 공지사항 수정페이지 수정
	@RequestMapping("/updateNotice")
	public String updateBoard(int cpage, Model model, NoticeDTO dto, int check_num, String keyword,
			String searchWord) {

		if (keyword.equals("제목")) {
			keyword = "title";
		} else if (keyword.equals("작성자")) {
			keyword = "writer";
		}

		int result = notService.modifyNotice(dto);

		model.addAttribute("result", result);

		return "redirect:/notice/noticeDetail?cpage=" + cpage + "&notice_seq=" + dto.getNotice_seq() + "&keyword=" + keyword
				+ "&searchWord=" + searchWord + "&check_num=" + check_num;
	}

	// 공지사항 검색 기능
	@RequestMapping("/searchNotice")
	public String searchNotice(int cpage, String keyword, String searchWord, Model model) throws Exception {
		int check_num = 2;
		System.out.println(keyword + searchWord);
		List<NoticeDTO> noticeList = notService.selectNoticeSearchByPaging(cpage, keyword, searchWord);


		List<NoticeDTO> list = dao.selectNoticeSearchByPaging(1, 10, keyword, searchWord);


		String navi = notService.getSearchPageNavi(cpage, keyword, searchWord);

		int totalBoardCount = notService.getRecordSearchCount(keyword, searchWord);

		model.addAttribute("keyword", keyword);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("totalBoardCount", totalBoardCount);
		model.addAttribute("check_num", check_num);
		model.addAttribute("cpage", cpage);
		model.addAttribute("navi", navi);
		model.addAttribute("noticeList", noticeList);

		return "notice/noticeList";
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
		//					String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String contextRoot = "/usr/local/tomcat8/apache-tomcat-8.5.73/webapps/upload";
		System.out.println(contextRoot);
		//					String fileRoot = contextRoot + "resources/images/";
		String fileRoot = contextRoot + "/summernote/";

		String originalFileName = multipartFile.getOriginalFilename(); // 오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
		String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명

		File targetFile = new File(fileRoot + savedFileName);
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
			//						jsonObject.addProperty("url", "/resources/images/" + savedFileName); // contextroot + resources + 저장할 내부 폴더명
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


	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:/";
	}
}
