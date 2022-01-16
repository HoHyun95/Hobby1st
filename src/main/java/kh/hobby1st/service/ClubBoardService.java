package kh.hobby1st.service;

import java.util.List;

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

	public int getRecordCount(int seq) {
		return cbdao.getRecordCount(seq);
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
	
	
	
	
	
	
	
	
	
	
	

	// 동호회 게시판 리스트
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
			pageNavi += "<a href='/clubBoard/boardList?cpage=" + (startNavi - 1) + "'><</a>";
		}

		for (int i = startNavi; i <= endNavi; i++) {
			pageNavi += "<a class='paging' id='paging" + i + "'" + " href='/clubBoard/boardList?cpage=" + i + "'>" + i
					+ "</a> ";
		}

		if (needNext) {
			pageNavi += "<a href='/clubBoard/boardList?cpage=" + (endNavi + 1) + "'>></a>";
		}
		return pageNavi;
	}

}
