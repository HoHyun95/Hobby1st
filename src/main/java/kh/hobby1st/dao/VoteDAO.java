package kh.hobby1st.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hobby1st.dto.VoteListDTO;

@Repository
public class VoteDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 투표 리스트에 추가
	public int insertVoteList(VoteListDTO dto) {
		return mybatis.insert("Vote.insertVoteList", dto);
	}
	
	// 해당 투표 옵션 추가하기
	public int insertVoteOption(String option) {
		return mybatis.insert("Vote.insertVoteOption", option);
	}

}
