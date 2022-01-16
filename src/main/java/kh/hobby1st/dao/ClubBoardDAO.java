package kh.hobby1st.dao;

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
		return mybatis.selectOne("ClubBoard.RecordCount",seq);
	}

	// 게시판 리스트 페이징하여 출력
	public List<ClubBoardDTO> selectBoardByPaging(int start, int end, int seq) {

		Map<String, String> map = new HashMap<>();

		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		map.put("cb_seq", String.valueOf(seq));

		return mybatis.selectList("ClubBoard.selectBoard", map);
	}
	
	// 게시판 상세보기
	public ClubBoardDTO boardDetail(int board_seq) {
		return mybatis.selectOne("ClubBoard.boardDetail",board_seq);
	}
	
	// 게시판 조회수 증가
	public int increaseView(int reply_seq) {
		return mybatis.update("ClubBoard.increaseView",reply_seq);
	}
	
	// 게시판 삭제
	public int deleteBoard(int board_seq) {
		return mybatis.delete("ClubBoard.deleteBoard", board_seq);
	}
	
	// 게시판 수정
	public int modifyBoard(ClubBoardDTO dto) {
		return mybatis.update("ClubBoard.modifyBoard", dto);
	}
	
	
	
	
	
	
	
	
	
	
	
	

}
