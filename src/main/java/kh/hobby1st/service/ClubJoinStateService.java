package kh.hobby1st.service;

import java.util.List;

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

}
