package kh.hobby1st.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.hobby1st.dao.ClubJoinStateDAO;
import kh.hobby1st.dto.ClubJoinStateDTO;
import kh.hobby1st.dto.ClubListDTO;
import kh.hobby1st.dto.MemberDTO;

@Service
public class ClubJoinStateService {

	@Autowired
	private ClubJoinStateDAO csDao;

	// 동호회 가입 요청
	public int requestJoin(ClubJoinStateDTO dto) {
		return csDao.requestJoin(dto);
	}

	// 동호회 가입요청자 정보
	public List<MemberDTO> joinMemberInfo(String boss_id) {
		return csDao.joinMemberInfo(boss_id);
	}

	// 동호회 가입요청 동호회 정보
	public List<ClubListDTO> joinClubInfo(String boss_id) {
		return csDao.joinClubInfo(boss_id);
	}

	// 동호회 가입 승인
	public int joinApprove(int cs_board_seq, String cs_join_id) {

		return csDao.joinApprove(cs_board_seq, cs_join_id);
	}

	// 동호회 가입 거절
	public int joinRefuse(int cs_board_seq, String cs_join_id) {
		
		int insertClubMember = csDao.insertClubMember(cs_board_seq, cs_join_id);

		return csDao.joinRefuse(cs_board_seq, cs_join_id);
	}

}
