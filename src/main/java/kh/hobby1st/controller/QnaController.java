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

import com.google.gson.JsonObject;

import kh.hobby1st.dao.QnaDAO;
import kh.hobby1st.dto.QnaDTO;
import kh.hobby1st.dto.QnaReplyDTO;
import kh.hobby1st.service.QnaService;
import kh.hobby1st.service.QnarService;

@Controller
@RequestMapping("/qna")
public class QnaController {


	@Autowired
	private HttpSession session;

	@Autowired
	private QnaService qService;
	
	@Autowired
	private QnarService qnarService;
	
	@Autowired
	private QnaDAO qdao;

	//Qna 리스트로 이동
	@RequestMapping("/qnaList")
	public String qnaList(int cpage, Model model)throws Exception {

		// 페이징적용 리스트
		List<QnaDTO> qnaList = qService.selectQnaByPaging(cpage);

		int check_num = 1;
		String navi = qService.getPageNavi(cpage);
		int totalNoticeCount = qService.getRecordCount();
//		
//		int replycount = qnarService.replyCount(qna_seq);

		model.addAttribute("totalNoticeCount", totalNoticeCount);
		model.addAttribute("check_num", check_num);
		model.addAttribute("cpage", cpage);
		model.addAttribute("navi", navi);
		model.addAttribute("qnaList", qnaList);
//		model.addAttribute("replycount", replycount);

		return "qna/qnaList";
	}

	//	게시판 작성 페이지 이동
	@RequestMapping("/qnaWrite")
	public String qnaWrite() {
		return "qna/qnaWrite";
	}

	// 게시판 작성
	@RequestMapping("/qnaInsert")
	public String qnaInsert(QnaDTO dto, Model model) {

		dto.setQna_writer((String) session.getAttribute("mem_id"));

		qService.insert(dto);
		int totalQnaCount = qService.getRecordCount();

		return "redirect:/news";
	}


	// 게시판 상세페이지 이동
	@RequestMapping("/qnaDetail")
	public String qnaDetail(int qna_seq, int cpage, Model model, int check_num, String keyword, String searchWord) {

		if (keyword.equals("title")) {
			keyword = "제목";
		} else if (keyword.equals("writer")) {
			keyword = "작성자";
		}
	
		String writerProfile = qService.writerProfile(qna_seq);


		QnaDTO detail = qService.qnaDetail(qna_seq);
		qService.increaseView(qna_seq);
		List<QnaReplyDTO> replyList = qnarService.selectReply(qna_seq);
		int replycount = qnarService.replyCount(qna_seq);
	
		List<String> reply_profile = qService.reply_profile(qna_seq);

		model.addAttribute("writerProfile", writerProfile);
//		model.addAttribute("reply_profile", reply_profile);
		model.addAttribute("keyword", keyword);
		model.addAttribute("searchWord", searchWord);
//		model.addAttribute("replycount", replycount);
		model.addAttribute("check_num", check_num);
 
		model.addAttribute("cpage", cpage); 
		model.addAttribute("replyList", replyList);
		model.addAttribute("detail", detail);
		return "qna/qnaDetail";
	}
	
	// 댓글 작성
	@RequestMapping("/insertReply")
	public String insertReply(QnaReplyDTO dto, int qna_seq, int cpage, int check_num, String keyword,
			String searchWord) {

		if (keyword.equals("제목")) {
			keyword = "title";
		} else if (keyword.equals("작성자")) {
			keyword = "writer";
		}

		dto.setQnar_writer((String) session.getAttribute("mem_id"));
//		dto.setCbr_nickname((String) session.getAttribute("user_nickName"));
		dto.setQnar_par_seq(qna_seq);

//		qnarService.plusReply(qna_seq);
		int result = qnarService.insert(dto);

		return "redirect:/qna/qnaDetail?cpage=" + cpage + "&qna_seq=" + qna_seq + "&keyword=" + keyword
				+ "&searchWord=" + searchWord + "&check_num=" + check_num;
	}

	// 댓글 삭제
	@RequestMapping("/deleteReply")
	public String deleteReply(int qnar_seq, int qna_seq, int cpage, int check_num, String keyword, String searchWord) {

		if (keyword.equals("제목")) {
			keyword = "title";
		} else if (keyword.equals("작성자")) {
			keyword = "writer";
		}

//		qnarService.minusReply(qna_seq);
		int result = qnarService.deleteReply(qnar_seq);

		return "redirect:/qna/qnaDetail?cpage=" + cpage + "&qna_seq=" + qna_seq + "&keyword=" + keyword
				+ "&searchWord=" + searchWord + "&check_num=" + check_num;
	}
	
	// 게시판 삭제
	@RequestMapping("/deleteQna")
	public String deleteBoard(int cpage, int qna_seq) {

		int result = qService.deleteQna(qna_seq);
		
		return "redirect:/news";
	}
	
	// 게시판 수정페이지 이동
		@RequestMapping("/modifyQna")
		public String modifyQna(int cpage, int qna_seq, Model model, int check_num, String keyword, String searchWord) {
			QnaDTO detail = qService.qnaDetail(qna_seq);

			model.addAttribute("keyword", keyword);
			model.addAttribute("searchWord", searchWord);
			model.addAttribute("check_num", check_num);
			model.addAttribute("cpage", cpage);
			model.addAttribute("detail", detail);
			return "qna/modify_qnaWrite";
		}

		// 게시판 수정페이지 수정
		@RequestMapping("/updateQna")
		public String updateQna(int cpage, Model model, QnaDTO dto, int check_num, String keyword,
				String searchWord) {

			if (keyword.equals("제목")) {
				keyword = "title";
			} else if (keyword.equals("작성자")) {
				keyword = "writer";
			}

			int result = qService.modifyQna(dto);

			model.addAttribute("result", result);

			return "redirect:/qna/qnaDetail?cpage=" + cpage + "&qna_seq=" + dto.getQna_seq() + "&keyword=" + keyword
					+ "&searchWord=" + searchWord + "&check_num=" + check_num;
		}

		// 게시판 검색 기능
		@RequestMapping("/searchQna")
		public String searchQna(int cpage, String keyword, String searchWord, Model model) throws Exception {
			int check_num = 2;
			System.out.println(keyword + searchWord);
			List<QnaDTO> qnaList = qService.selectQnaSearchByPaging(cpage, keyword, searchWord);
			List<QnaDTO> list = qdao.selectQnaSearchByPaging(1, 10, keyword, searchWord);

			String navi = qService.getSearchPageNavi(cpage, keyword, searchWord);

			int totalQnaCount = qService.getRecordSearchCount(keyword, searchWord);

			model.addAttribute("keyword", keyword);
			model.addAttribute("searchWord", searchWord);
			model.addAttribute("totalQnaCount", totalQnaCount);
			model.addAttribute("check_num", check_num);
			model.addAttribute("cpage", cpage);
			model.addAttribute("navi", navi);
			model.addAttribute("qnaList", qnaList);

			return "qna/qnaList";
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
//			String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
			String contextRoot = "/usr/local/tomcat8/apache-tomcat-8.5.73/webapps/upload";
			System.out.println(contextRoot);
//			String fileRoot = contextRoot + "resources/images/";
			String fileRoot = contextRoot + "/summernote/";

			String originalFileName = multipartFile.getOriginalFilename(); // 오리지날 파일명
			String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
			String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명

			File targetFile = new File(fileRoot + savedFileName);
			try {
				InputStream fileStream = multipartFile.getInputStream();
				FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
//				jsonObject.addProperty("url", "/resources/images/" + savedFileName); // contextroot + resources + 저장할 내부 폴더명
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

}
