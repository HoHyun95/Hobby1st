package kh.hobby1st.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.hobby1st.dao.NoticeDAO;
import kh.hobby1st.dto.ClubBoardDTO;
import kh.hobby1st.dto.NoticeDTO;
import kh.hobby1st.statics.Statics;

@Service
public class NoticeService {

	@Autowired
	private NoticeDAO notDao;

	// 공지사항 총 개수
	public int getRecordCount() {
		return notDao.getRecordCount();
	}

	public int insert(NoticeDTO dto) {
		return notDao.insert(dto);
	}

	// 공지사항 상세보기
	public NoticeDTO noticeDetail(int not_seq) {
		return notDao.noticeDetail(not_seq);
	}

	// 작성자 프로필 가져오기
	public String writerProfile(int notice_seq) {
		return notDao.writerProfile(notice_seq);
	}

	// 공지사항 조회수 증가
	public int increaseView(int seq) {
		return notDao.increaseView(seq);
	}

	// 공지사항 삭제
	public int deleteNotice(int notice_seq) {
		return notDao.deleteNotice(notice_seq);
	}

	// 공지사항 수정
	public int modifyNotice(NoticeDTO dto) {
		return notDao.modifyNotice(dto);
	}

	// 공지사항 프로필 가져오기
	//	public String writerProfile(int not_seq) {
	//		return notDao.writerProfile(not_seq);
	//	}

	// 공지사항 리스트 페이징
	public List<NoticeDTO> selectNoticeAll (int cpage) throws Exception{
		int currentPage = cpage;

		int pageTotalCount = this.getRecordCount();
		if (currentPage < 1) {
			currentPage = 1;
		}
		if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		int start = currentPage * Statics.RECORD_COUNT_PER_PAGE - (Statics.RECORD_COUNT_PER_PAGE - 1);
		int end = currentPage * Statics.RECORD_COUNT_PER_PAGE;

		return notDao.selectNoticeAll(start, end);
	}

	// 공지사항 총 페이지
	public int getPageTotalCount() throws Exception {
		int recordTotalCount = this.getRecordCount();
		int pageTotalCount = 0;

		if (recordTotalCount % Statics.RECORD_COUNT_PER_PAGE == 0) {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE;
		} else {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE + 1;
		}
		return pageTotalCount;
	}

	// 페이지 네비게이터
	public String getPageNavi(int cpage) throws Exception {

		int recordTotalCount = this.getRecordCount();
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
			pageNavi += "<a class='paging' href='/notice/noticeList?cpage=" + (startNavi - 1) + "'><</a>";
		}

		for (int i = startNavi; i <= endNavi; i++) {
			pageNavi += "<a class='paging' id='paging" + i + "'" + " href='/notice/noticeList?cpage=" + i + "'>" + i
					+ "</a> ";
		}

		if (needNext) {
			pageNavi += "<a class='paging' href='/notice/noticeList?cpage=" + (endNavi + 1) + "'>></a>";
		}
		return pageNavi;
	}

	// 검색된 결과 개수
	public int getRecordSearchCount(String keyword, String searchWord) {
		return notDao.getRecordSearchCount(keyword, searchWord);
	}

	// ---------------------- 공지사항 검색 리스트 페이징 ----------------------
	public List<NoticeDTO> selectNoticeSearchByPaging(int cpage, String keyword, String searchWord)
			throws Exception {
		int currentPage = cpage;

		int pageTotalCount = this.getRecordSearchCount( keyword, searchWord);
		if (currentPage < 1) {
			currentPage = 1;
		}
		if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		int start = currentPage * Statics.RECORD_COUNT_PER_PAGE - (Statics.RECORD_COUNT_PER_PAGE - 1);
		int end = currentPage * Statics.RECORD_COUNT_PER_PAGE;

		return notDao.selectNoticeSearchByPaging(start, end, keyword, searchWord);
	}


	//		// 페이지 네비게이터
	public String getSearchPageNavi(int cpage, String keyword, String searchWord) throws Exception {

		int recordTotalCount = this.getRecordSearchCount(keyword, searchWord);
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
			pageNavi += "<a class='paging' href='/notice/searchNotice?cpage=" + (startNavi - 1) + "&keyword="
					+ keyword + "&searchWord=" + searchWord + "'><</a>";
		}

		for (int i = startNavi; i <= endNavi; i++) {
			pageNavi += "<a class='paging' id='paging" + i + "'" + " href='/notice/searchNotice?cpage=" + i
					+ "&keyword=" + keyword + "&searchWord=" + searchWord + "'>" + i + "</a> ";
		}

		if (needNext) {
			pageNavi += "<a class='paging' href='/notice/searchNotice?cpage=" + (endNavi + 1) + "&keyword=" + keyword
					+ "&searchWord=" + searchWord + "'>></a>";
		}
		return pageNavi;
	}



}
