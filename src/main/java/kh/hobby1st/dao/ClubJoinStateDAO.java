package kh.hobby1st.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hobby1st.dto.ClubJoinStateDTO;
import kh.hobby1st.dto.ClubListDTO;
import kh.hobby1st.dto.MemberDTO;

@Repository
public class ClubJoinStateDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 동호회 가입 요청
	public int requestJoin(ClubJoinStateDTO dto) {
		return mybatis.insert("JoinState.requestJoin", dto);
	}

	// 동호회 가입요청자 정보
	public List<MemberDTO> joinMemberInfo(String boss_id) {
		return mybatis.selectList("JoinState.joinMemberInfo", boss_id);
	}

	// 동호회 가입요청 동호회 정보
	public List<ClubListDTO> joinClubInfo(String boss_id) {
		return mybatis.selectList("JoinState.joinClubInfo", boss_id);
	}
}
