package kh.hobby1st.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hobby1st.dto.ClubBoardDTO;

@Repository
public class BoardAdminDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 게시글 수
	public int countBoard() {
		return mybatis.selectOne("ClubBoard.countBoard");
	}
	
	
	// 관리자 페이지에서 동호회 리스트 페이징
		public List<ClubBoardDTO> ClubBoardByPaging(int start, int end ){
			
			Map<String,String> map = new HashMap<>();
			
			map.put("start", String.valueOf(start));
			map.put("end", String.valueOf(end));
			
			return mybatis.selectList("ClubBoard.ClubBoardByPaging",map);
			
		}
	
	
	
}
