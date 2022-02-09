package kh.hobby1st.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.hobby1st.dao.ClubJoinStateDAO;
import kh.hobby1st.dao.ClubListDAO;
import kh.hobby1st.dto.ClubJoinStateDTO;
import kh.hobby1st.dto.ClubListDTO;
import kh.hobby1st.dto.MemberDTO;

@Service
public class ClubJoinStateService {

	@Autowired
	private ClubJoinStateDAO csDao;
	
	@Autowired
	private ClubListDAO clDao;

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
		
		// 동호회 회원 수 증가
		clDao.plusMemCount(cs_board_seq);
		

		int insertClubMember = csDao.insertClubMember(cs_board_seq, cs_join_id);

		return csDao.joinApprove(cs_board_seq, cs_join_id);
	}

	// 동호회 가입 거절
	public int joinRefuse(int cs_board_seq, String cs_join_id) {

		return csDao.joinRefuse(cs_board_seq, cs_join_id);
	}

//	// 해당 동호회에 요청했는지
//	public int checkClubJoin(int cs_board_seq, String cs_join_id) {
//
//		return csDao.checkClubJoin(cs_board_seq, cs_join_id);
//	}

	// 나의 동호회 활동 정보 (동호회정보)
	public List<ClubListDTO> recentlyClubInfo(String cs_join_id, int check) {

		List<ClubListDTO> list = new ArrayList<>();

		list = csDao.orderDateClubInfo(cs_join_id);

		return list;
	}

	// 나의 동호회 활동 정보 (상태정보)
	public List<ClubJoinStateDTO> recentlyStateInfo(String cs_join_id, int check) {

		List<ClubJoinStateDTO> list = new ArrayList<>();

		if (check == 1) { // 날짜순
			list = csDao.orderDateStateInfo(cs_join_id);
		} else if (check == 2) { // 상태순
			list = csDao.orderStateStateInfo(cs_join_id);
		}

		return list;
	}
	
	// 클럽 탈퇴하기
	public int leaveClub(String mem_id, int cb_seq) {
		
		int result = 0;
		
		// 회원 수 감소
		clDao.minusMemCount(cb_seq);
		
		int deleteClubmember = csDao.deleteClubmember(mem_id, cb_seq);
		int deleteJoinState = csDao.deleteJoinState(mem_id, cb_seq);
		
		if(deleteClubmember == 1 && deleteJoinState == 1) {
			result = 1;
		}
		return result;
	}
	
	// 동호회 해체하기
	public int breakClub(int board_seq) {
		
		int result = 1;
		
		int breakClubList = csDao.breakClubList(board_seq);
		int breakClubMember = csDao.breakClubMember(board_seq);
		int breakClubState = csDao.breakClubState(board_seq);
		
		
		return result;
	}
	
	// 가입요청 취소하기
	public int joinCencel(String mem_id, int cb_seq) {
		return csDao.deleteJoinState(mem_id, cb_seq);
	}
	
//	회원 탈퇴시 상태 정보 삭제
	public int leaveMemberState(String cs_join_id) {
		return csDao.leaveMemberState(cs_join_id);
	}

}
