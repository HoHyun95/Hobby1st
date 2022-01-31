package kh.hobby1st.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hobby1st.dto.VoteListDTO;
import kh.hobby1st.dto.VoteOptionDTO;

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
	
	// 투표 리스트 (전쳬)
	public List<VoteListDTO> selectVoteAll() {
		return mybatis.selectList("Vote.selectVoteAll");
	}
	
	// 해당 투표 정보 가져오기
	public List<VoteListDTO> selectVoteDetail(int vl_seq) {
		return mybatis.selectList("Vote.selectVoteDetail", vl_seq);
	}
	
	
	// 해당 투표 옵션 값들 가져오기
	public List<VoteOptionDTO> selectVoteOption(int vo_vote_seq) {
		return mybatis.selectList("Vote.selectVoteOption", vo_vote_seq);
	}

	// 해당 동호회에 대한 투표 여부
	public int voteCheck(int vc_vote_seq, String vc_vote_id) {
		
		Map<String, String> map = new HashMap<>();

		map.put("vc_vote_seq", String.valueOf(vc_vote_seq));
		map.put("vc_vote_id", vc_vote_id);
		
		return mybatis.selectOne("Vote.voteCheck", map);
	}
	
	// 투표 목록들에 대한 나의 투표 참여 여부 리스트
	public List<VoteListDTO> voteCheckList(String vc_vote_id) {
		return mybatis.selectList("Vote.voteCheckList", vc_vote_id);
	}

}
