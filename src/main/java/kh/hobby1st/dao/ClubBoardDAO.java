package kh.hobby1st.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hobby1st.dto.ClubBoardDTO;

@Repository
public class ClubBoardDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 게시판 작성하기
	public int insert(ClubBoardDTO dto) {
		return mybatis.insert("ClubBoard.insertBoard", dto);
	}

	// 해당 동호회 게시판 총 개수
	public int getRecordCount(int seq) {
		return mybatis.selectOne("ClubBoard.RecordCount", seq);
	}

	// 검색 시 총 개수
	public int getRecordSearchCount(int club_board_id, String keyword, String searchWord) {

		Map<String, String> map = new HashMap<>();

		map.put("searchWord", String.valueOf(searchWord));
		map.put("club_board_id", String.valueOf(club_board_id));

		int count = 0;
		if (keyword.equals("제목")) {
			count = mybatis.selectOne("ClubBoard.searchTitleCount", map);
		} else if (keyword.equals("작성자")) {
			count = mybatis.selectOne("ClubBoard.searchWriterCount", map);
		}
		return count;

	}

	// 게시판 리스트 페이징하여 출력
	public List<ClubBoardDTO> selectBoardByPaging(int start, int end, int seq) {

		Map<String, String> map = new HashMap<>();

		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		map.put("club_board_id", String.valueOf(seq));

		return mybatis.selectList("ClubBoard.selectBoard", map);
	}

	// 게시판 상세보기
	public ClubBoardDTO boardDetail(int board_seq) {
		return mybatis.selectOne("ClubBoard.boardDetail", board_seq);
	}

	// 게시판 조회수 증가
	public int increaseView(int reply_seq) {
		return mybatis.update("ClubBoard.increaseView", reply_seq);
	}

	// 게시판 삭제
	public int deleteBoard(int board_seq) {
		return mybatis.delete("ClubBoard.deleteBoard", board_seq);
	}

	// 게시판 수정
	public int modifyBoard(ClubBoardDTO dto) {
		return mybatis.update("ClubBoard.modifyBoard", dto);
	}

	// 게시판 제목 검색
	public List<ClubBoardDTO> selectBoardSearchByPaging(int start, int end, int seq, String keyword,
			String searchWord) {

		Map<String, String> map = new HashMap<>();

		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		map.put("club_board_id", String.valueOf(seq));
		map.put("searchWord", searchWord);

		List<ClubBoardDTO> list = new ArrayList<ClubBoardDTO>();
		if (keyword.equals("제목")) {
			list = mybatis.selectList("ClubBoard.searchTitle", map);
		} else if (keyword.equals("작성자")) {
			list = mybatis.selectList("ClubBoard.searchWriter", map);
		}
		return list;
	}

	// ------------ 추천 기능 -------------------

	// 추천 여부 확인
	public int checkRec(int cb_seq, String rec_id) {

		Map<String, String> map = new HashMap<>();

		map.put("cb_seq", String.valueOf(cb_seq));
		map.put("rec_id", rec_id);

		return mybatis.selectOne("ClubBoardRec.checkRec", map);
	}

	// 추천한 게시글에 id 저장
	public int insertRec(int cb_seq, String rec_id) {

		Map<String, String> map = new HashMap<>();

		map.put("cb_seq", String.valueOf(cb_seq));
		map.put("rec_id", rec_id);

		return mybatis.insert("ClubBoardRec.insertRec", map);
	}

	// 추천 쉬소
	public int deleteRec(int cb_seq, String rec_id) {

		Map<String, String> map = new HashMap<>();

		map.put("cb_seq", String.valueOf(cb_seq));
		map.put("rec_id", rec_id);

		return mybatis.insert("ClubBoardRec.deleteRec", map);
	}
	
	// 추천수 갱신
	public int updateRec(int cb_seq) {
		return mybatis.update("ClubBoardRec.updateRec", cb_seq);
	}
	
	// 추천수
	public int recCount(int cb_seq) {
		return mybatis.selectOne("ClubBoardRec.recCount", cb_seq);
	}
	

}
