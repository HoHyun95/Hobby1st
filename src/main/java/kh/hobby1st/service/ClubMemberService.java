package kh.hobby1st.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.hobby1st.dao.ClubMemberDAO;
import kh.hobby1st.dto.ClubMemberDTO;
import kh.hobby1st.dto.MemberDTO;
import kh.hobby1st.statics.Statics;

@Service
public class ClubMemberService {

	@Autowired
	public ClubMemberDAO dao;

	// 총 동호회 회원 가입 수
	public int totalClubMember() {
		return dao.totalClubMember();
	}

	// 해당 동호회 총 인원 수
	private int getRecordCount(int seq) {
		return dao.getRecordCount(seq);
	}

	public int deleteMember(String id) {
		return dao.deleteMember(id);
	}

	public List<MemberDTO> selectMemberByPaging(int cpage, int seq) throws Exception {
		int currentPage = cpage;

		int pageTotalCount = this.getPageTotalCount(seq);
		if (currentPage < 1) {
			currentPage = 1;
		}
		if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		int start = currentPage * Statics.RECORD_COUNT_PER_PAGE - (Statics.RECORD_COUNT_PER_PAGE - 1);
		int end = currentPage * Statics.RECORD_COUNT_PER_PAGE;

		return dao.selectMemberByPaging(start, end, seq);

	}

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
			pageNavi += "<a href='/clubMember/memberList?cpage=" + (startNavi - 1) + "'><</a>";
		}

		for (int i = startNavi; i <= endNavi; i++) {
			pageNavi += "<a class='paging' id='paging" + i + "'" + " href='/clubMember/memberList?cpage=" + i + "'>" + i
					+ "</a> ";
		}

		if (needNext) {
			pageNavi += "<a href='/clubMember/memberList?cpage=" + (endNavi + 1) + "'>></a>";
		}
		return pageNavi;
	}

	//
	public List<ClubMemberDTO> selectClubMemberByPaging(int cpage, int seq) throws Exception {
		int currentPage = cpage;

		int pageTotalCount = this.getPageTotalCount(seq);
		if (currentPage < 1) {
			currentPage = 1;
		}
		if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		int start = currentPage * Statics.RECORD_COUNT_PER_PAGE - (Statics.RECORD_COUNT_PER_PAGE - 1);
		int end = currentPage * Statics.RECORD_COUNT_PER_PAGE;

		return dao.selectClubMemberByPaging(start, end, seq);

	}

	// 해당 동호회 회원 정보 가져오기
	public List<MemberDTO> clubMemberInfo(int cb_seq) {
		return dao.clubMemberInfo(cb_seq);
	}

}
