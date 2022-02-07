package kh.hobby1st.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.hobby1st.dao.ClubBoardDAO;
import kh.hobby1st.dto.ClubBoardDTO;
import kh.hobby1st.statics.Statics;

@Service
public class ClubBoardService {

	@Autowired
	public ClubBoardDAO cbdao;

	public int insert(ClubBoardDTO dto) {
		return cbdao.insert(dto);
	}

	// 해당 동호회 게시판 총 개수
	public int getRecordCount(int seq) {
		return cbdao.getRecordCount(seq);
	}

	// 검색된 결과 개수
	public int getRecordSearchCount(int club_board_id, String keyword, String searchWord) {
		return cbdao.getRecordSearchCount(club_board_id, keyword, searchWord);
	}

	// 게시판 상제보기
	public ClubBoardDTO boardDetail(int seq) {
		return cbdao.boardDetail(seq);
	}

	// 게시판 조회수 증가
	public int increaseView(int seq) {
		return cbdao.increaseView(seq);
	}

	// 게시판 삭제
	public int deleteBoard(int board_seq) {
		return cbdao.deleteBoard(board_seq);
	}

	// 게시판 수정
	public int modifyBoard(ClubBoardDTO dto) {
		return cbdao.modifyBoard(dto);
	}

	// -------------------------- 추천 기능 --------------------------

	public int clubRecommend(int cl_id, String rec_id) {

		int check = cbdao.checkRec(cl_id, rec_id);

		int checkRec = 0;
		if (check == 1) {
			cbdao.deleteRec(cl_id, rec_id);
			checkRec = 0;
		} else if (check == 0) {
			cbdao.insertRec(cl_id, rec_id);
			checkRec = 1;
		}

		cbdao.updateRec(cl_id);
		return checkRec;
	}

	// 추천 여부 확인
	public int checkRec(int cb_seq, String rec_id) {
		return cbdao.checkRec(cb_seq, rec_id);
	}

	// 댓글 프로필 불러오기
	public List<String> reply_profile(int cb_Seq) {
		return cbdao.reply_profile(cb_Seq);
	}

	// 작성자 프로필 가져오기
	public String writerProfile(int cb_seq) {
		return cbdao.writerProfile(cb_seq);
	}

//	// 추천한 게시글에 id 저장
//	public int insertRec(int cb_seq, String rec_id) {
//
//		return cbdao.insertRec(cb_seq, rec_id);
//	}
//
//	// 추천 쉬소
//	public int deleteRec(int cb_seq, String rec_id) {
//
//		return cbdao.deleteRec(cb_seq, rec_id);
//	}
//
//	// 추천수 갱신
//	public int updateRec(int cb_seq) {
//		return cbdao.updateRec(cb_seq);
//	}

	// 추천수
	public int recCount(int cb_seq) {
		return cbdao.recCount(cb_seq);
	}

	// ---------------------- 동호회 게시판 리스트 페이징 ----------------------
	public List<ClubBoardDTO> selectBoardByPaging(int cpage, int seq) throws Exception {
		int currentPage = cpage;

		int pageTotalCount = this.getRecordCount(seq);
		if (currentPage < 1) {
			currentPage = 1;
		}
		if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		int start = currentPage * Statics.RECORD_COUNT_PER_PAGE - (Statics.RECORD_COUNT_PER_PAGE - 1);
		int end = currentPage * Statics.RECORD_COUNT_PER_PAGE;

		return cbdao.selectBoardByPaging(start, end, seq);
	}

	// 게시판 총 페이지
	public int getPageTotalCount(int seq) throws Exception {
		int recordTotalCount = this.getRecordCount(seq);
		int pageTotalCount = 0;

		if (recordTotalCount % Statics.RECORD_COUNT_PER_PAGE == 0) {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE;
		} else {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE + 1;
		}
		return pageTotalCount;
	}

// 페이지 네비게이터
	public String getPageNavi(int cpage, int seq) throws Exception {

		int recordTotalCount = this.getRecordCount(seq);
		// 총 페이지의 개수
		int pageTotalCount = 0;

		if (recordTotalCount % Statics.RECORD_COUNT_PER_PAGE == 0) {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE;
			// 페이지가 딱 떨어지지 않으면 1을 더해서 페이지를 하나 더 만들어라
		} else {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE + 1;
		}

		// 현재 페이지
		int currentPage = cpage;

		// 혹시라도 현재페이지가 1페이지보다 작으면 1로 만들어라, 현재페이지가 토달 카운트 보다 크면 현재페이지는 토탈카운트 페이지로.
		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		int startNavi = (currentPage - 1) / Statics.NAVI_COUNT_PER_PAGE * Statics.NAVI_COUNT_PER_PAGE + 1;
		int endNavi = startNavi + Statics.NAVI_COUNT_PER_PAGE - 1;

		// 공식에 의해 발생한 endnavi 값이 실제 페이지 전체 개수보다 클경우
		if (endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;

		if (startNavi == 1) {
			needPrev = false;
		}

		if (endNavi == pageTotalCount) {
			needNext = false;
		}

		String pageNavi = "";

		if (needPrev) {
			pageNavi += "<a class='paging' href='/clubBoard/boardList?cpage=" + (startNavi - 1) + "'><</a>";
		}

		for (int i = startNavi; i <= endNavi; i++) {
			pageNavi += "<a class='paging' id='paging" + i + "'" + " href='/clubBoard/boardList?cpage=" + i + "'>" + i
					+ "</a> ";
		}

		if (needNext) {
			pageNavi += "<a class='paging' href='/clubBoard/boardList?cpage=" + (endNavi + 1) + "'>></a>";
		}
		return pageNavi;
	}

	// ---------------------- 게시판 검색 리스트 페이징 ----------------------
	public List<ClubBoardDTO> selectBoardSearchByPaging(int cpage, int seq, String keyword, String searchWord)
			throws Exception {
		int currentPage = cpage;

		int pageTotalCount = this.getRecordSearchCount(seq, keyword, searchWord);
		if (currentPage < 1) {
			currentPage = 1;
		}
		if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		int start = currentPage * Statics.RECORD_COUNT_PER_PAGE - (Statics.RECORD_COUNT_PER_PAGE - 1);
		int end = currentPage * Statics.RECORD_COUNT_PER_PAGE;

		return cbdao.selectBoardSearchByPaging(start, end, seq, keyword, searchWord);
	}

	// 게시판 총 페이지
	public int getSearchTotalCount(int club_board_id, String keyword, String searchWord) throws Exception {
		int recordTotalCount = this.getRecordSearchCount(club_board_id, keyword, searchWord);
		int pageTotalCount = 0;

		if (recordTotalCount % Statics.RECORD_COUNT_PER_PAGE == 0) {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE;
		} else {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE + 1;
		}
		return pageTotalCount;
	}

	// 페이지 네비게이터
	public String getSearchPageNavi(int cpage, int club_board_id, String keyword, String searchWord) throws Exception {

		int recordTotalCount = this.getRecordSearchCount(club_board_id, keyword, searchWord);
		// 총 페이지의 개수
		int pageTotalCount = 0;

		if (recordTotalCount % Statics.RECORD_COUNT_PER_PAGE == 0) {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE;
			// 페이지가 딱 떨어지지 않으면 1을 더해서 페이지를 하나 더 만들어라
		} else {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE + 1;
		}

		// 현재 페이지
		int currentPage = cpage;

		// 혹시라도 현재페이지가 1페이지보다 작으면 1로 만들어라, 현재페이지가 토달 카운트 보다 크면 현재페이지는 토탈카운트 페이지로.
		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		int startNavi = (currentPage - 1) / Statics.NAVI_COUNT_PER_PAGE * Statics.NAVI_COUNT_PER_PAGE + 1;
		int endNavi = startNavi + Statics.NAVI_COUNT_PER_PAGE - 1;

		// 공식에 의해 발생한 endnavi 값이 실제 페이지 전체 개수보다 클경우
		if (endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;

		if (startNavi == 1) {
			needPrev = false;
		}

		if (endNavi == pageTotalCount) {
			needNext = false;
		}

		String pageNavi = "";

		if (needPrev) {
			pageNavi += "<a class='paging' href='/clubBoard/searchBoard?cpage=" + (startNavi - 1) + "&keyword="
					+ keyword + "&searchWord=" + searchWord + "'><</a>";
		}

		for (int i = startNavi; i <= endNavi; i++) {
			pageNavi += "<a class='paging' id='paging" + i + "'" + " href='/clubBoard/searchBoard?cpage=" + i
					+ "&keyword=" + keyword + "&searchWord=" + searchWord + "'>" + i + "</a> ";
		}

		if (needNext) {
			pageNavi += "<a class='paging' href='/clubBoard/searchBoard?cpage=" + (endNavi + 1) + "&keyword=" + keyword
					+ "&searchWord=" + searchWord + "'>></a>";
		}
		return pageNavi;
	}
	
	// 게시판 게시글 전체 출력 (페이징 적용X)
	public List<ClubBoardDTO> selectAll(){
		return cbdao.selectAll();
	}
	
	// 관리자 지난주 게시글 등록 수
	public int lastMonday() {
		return cbdao.lastMonday();
	}
	
	// 관리자 지난주 게시글 등록 수
	public int lastTuesday() {
		return cbdao.lastTuesday();
	}
	
	// 관리자 지난주 게시글 등록 수
	public int lastWednesday() {
		return cbdao.lastWednesday();
	}
	
	// 관리자 지난주 게시글 등록 수
	public int lastThurseday() {
		return cbdao.lastThurseday();
	}
	
	// 관리자 지난주 게시글 등록 수
	public int lastFriday() {
		return cbdao.lastFriday();
	}
	
	// 관리자 지난주 게시글 등록 수
	public int lastSaturday() {
		return cbdao.lastSaturday();
	}
	
	// 관리자 지난주 게시글 등록 수
	public int lastSunday() {
		return cbdao.lastSunday();
	}
	

}
