package kh.hobby1st.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	// 동호회 가입 승인
	public int joinApprove(int cs_board_seq, String cs_join_id) {

		Map<String, String> map = new HashMap<>();

		map.put("cs_board_seq", String.valueOf(cs_board_seq));
		map.put("cs_join_id", cs_join_id);

		return mybatis.update("JoinState.joinApprove", map);
	}

	// 동호회 가입 거절
	public int joinRefuse(int cs_board_seq, String cs_join_id) {

		Map<String, String> map = new HashMap<>();

		map.put("cs_board_seq", String.valueOf(cs_board_seq));
		map.put("cs_join_id", cs_join_id);

		return mybatis.update("JoinState.joinRefuse", map);
	}

	// 승인한 회원 동호회 회원목록에 넣기
	public int insertClubMember(int cm_par_seq, String cm_mem_id) {

		Map<String, String> map = new HashMap<>();

		map.put("cm_par_seq", String.valueOf(cm_par_seq));
		map.put("cm_mem_id", cm_mem_id);

		return mybatis.insert("JoinState.insertClubMember", map);
	}

	// 해당 동호회에 요청했는지
	public int checkClubJoin(int cs_board_seq, String cs_join_id) {

		Map<String, String> map = new HashMap<>();

		map.put("cs_board_seq", String.valueOf(cs_board_seq));
		map.put("cs_join_id", cs_join_id);

		return mybatis.selectOne("JoinState.checkClubJoin", map);
	}

	// 나의 동호회 활동 정보 날짜순 (동호회정보)
	public List<ClubListDTO> orderDateClubInfo(String cs_join_id) {
		return mybatis.selectList("JoinState.orderDateClubInfo", cs_join_id);
	}

	// 나의 동호회 활동 정보 날짜순 (상태 정보)
	public List<ClubJoinStateDTO> orderDateStateInfo(String cs_join_id) {
		return mybatis.selectList("JoinState.orderDateStateInfo", cs_join_id);
	}

	// 나의 동호회 활동 정보 상태순 (동호회정보)
	public List<ClubListDTO> orderStateClubInfo(String cs_join_id) {
		return mybatis.selectList("JoinState.orderStateClubInfo", cs_join_id);
	}

	// 나의 동호회 활동 정보 상태순 (상태 정보)
	public List<ClubJoinStateDTO> orderStateStateInfo(String cs_join_id) {
		return mybatis.selectList("JoinState.orderStateStateInfo", cs_join_id);
	}

	// 클럽 탈퇴하기 (club_join_state Table에서 삭제)
	public int deleteJoinState(String cs_join_id, int cs_board_seq) {

		Map<String, String> map = new HashMap<>();

		map.put("cs_board_seq", String.valueOf(cs_board_seq));
		map.put("cs_join_id", cs_join_id);

		return mybatis.delete("JoinState.deleteJoinState", map);
	}

	// 클럽 탈퇴하기 (club_member Table에서 삭제)
	public int deleteClubmember(String cm_mem_id, int cm_par_seq) {

		Map<String, String> map = new HashMap<>();

		map.put("cm_par_seq", String.valueOf(cm_par_seq));
		map.put("cm_mem_id", cm_mem_id);

		return mybatis.delete("JoinState.deleteClubmember", map);
	}
	
	//	동호회 해체시 club_list 에서 제외
	public int breakClubList(int club_seq) {
		return mybatis.delete("JoinState.breakClubList", club_seq);
	}
	
  	
	// 	동호회 해체시 각 동호회원들 club_member 에서 제외
	public int breakClubMember(int club_seq) {
		return mybatis.delete("JoinState.breakClubMember", club_seq);
	}
  	
	//  동회회원들 해당 동호회 해체 상태로 변경
	public int breakClubState(int club_seq) {
		return mybatis.update("JoinState.breakClubState", club_seq);
	}
	
	//	회원 탈퇴시 상태 정보 삭제
	public int leaveMemberState(String cs_join_id) {
		return mybatis.delete("JoinState.leaveMemberState", cs_join_id);
	}
	
	
	
	
	
	

}
