package kh.hobby1st.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hobby1st.dto.ClubBoardDTO;
import kh.hobby1st.dto.QnaDTO;

@Repository
public class QnaDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 게시판 작성하기
	public int insert(QnaDTO dto) {
		return mybatis.insert("Qna.insertQna", dto);
	}

	// 해당 동호회 게시판 총 개수
	public int getRecordCount() {
		return mybatis.selectOne("Qna.recordCount");
	}

	// 검색 시 총 개수
	public int getRecordSearchCount(String keyword, String searchWord) {

		Map<String, String> map = new HashMap<>();

		map.put("searchWord", String.valueOf(searchWord));
//		map.put("club_board_id", String.valueOf(club_board_id));

		int count = 0;
		if (keyword.equals("제목")) {
			count = mybatis.selectOne("Qna.searchTitleCount", map);
		} else if (keyword.equals("작성자")) {
			count = mybatis.selectOne("Qna.searchWriterCount", map);
		}
		return count;
	}
	
	// 게시판 리스트 페이징하여 출력
	public List<QnaDTO> selectQnaByPaging(int start, int end) {

		Map<String, String> map = new HashMap<>();

		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
//		map.put("club_board_id", String.valueOf(seq));

		return mybatis.selectList("Qna.selectQna", map);
	}

	// 게시판 상세보기
	public QnaDTO qnaDetail(int qna_seq) {
		return mybatis.selectOne("Qna.qnaDetail", qna_seq);
	}

	// 게시판 조회수 증가
	public int increaseView(int qna_seq) {
		return mybatis.update("Qna.increaseView", qna_seq);
	}

	// 게시판 삭제
	public int deleteQna(int qna_seq) {
		return mybatis.delete("Qna.deleteQna", qna_seq);
	}

	// 게시판 수정
	public int modifyQna(QnaDTO dto) {
		return mybatis.update("Qna.modifyQna", dto);
	}

	// 게시판 제목 검색
	public List<QnaDTO> selectQnaSearchByPaging(int start, int end, String keyword,
				String searchWord) {

			Map<String, String> map = new HashMap<>();

			map.put("start", String.valueOf(start));
			map.put("end", String.valueOf(end));
//			map.put("club_board_id", String.valueOf(seq));
			map.put("searchWord", searchWord);

			List<QnaDTO> list = new ArrayList<QnaDTO>();
			if (keyword.equals("제목")) {
				list = mybatis.selectList("Qna.searchTitle", map);
			} else if (keyword.equals("작성자")) {
				list = mybatis.selectList("Qna.searchWriter", map);
			}
			return list;
		}
	
	// 댓글 프로필 불러오기
	public List<String> reply_profile(int qna_seq) {
		return mybatis.selectList("QnaReply.reply_profile",qna_seq);
	}
	
	// 작성자 프로필 가져오기
	public String writerProfile(int qna_seq) {
		return mybatis.selectOne("Qna.writerProfile", qna_seq);
	}
}
