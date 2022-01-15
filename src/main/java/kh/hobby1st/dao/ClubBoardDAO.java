package kh.hobby1st.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hobby1st.dto.ClubBoardDTO;
import kh.hobby1st.dto.MemberDTO;

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

}
