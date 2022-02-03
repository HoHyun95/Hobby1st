package kh.hobby1st.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.hobby1st.dao.VoteDAO;
import kh.hobby1st.dto.VoteListDTO;
import kh.hobby1st.dto.VoteOptionDTO;

@Service
public class VoteService {

	@Autowired
	private VoteDAO voteDao;

	// 투표 리스트에 추가
	public int insertVoteList(VoteListDTO dto, String edateY, String edateM, String edateD) {
		Date edate = Date.valueOf(edateY + "-" + edateM + "-" + edateD);
		dto.setVl_end_date(edate);

		return voteDao.insertVoteList(dto);
	}

	// 해당 투표 옵션 추가하기
	public int insertVoteOption(String option) {
		return voteDao.insertVoteOption(option);
	}

	// 투표 리스트 (전쳬)
	public List<VoteListDTO> selectVoteAll() {
		return voteDao.selectVoteAll();
	}

	// 해당 투표 정보 가져오기
	public VoteListDTO selectVoteDetail(int vl_seq) {
		return voteDao.selectVoteDetail(vl_seq);
	}

	// 해당 투표 옵션 값들 가져오기
	public List<VoteOptionDTO> selectVoteOption(int vo_vote_seq) {
		return voteDao.selectVoteOption(vo_vote_seq);
	}

	// 해당 동호회에 대한 투표 여부
	public int voteCheck(int vc_vote_seq, String vc_vote_id) {

		return voteDao.voteCheck(vc_vote_seq, vc_vote_id);
	}

	// 투표 목록들에 대한 나의 투표 참여 여부 리스트
	public List<VoteListDTO> voteCheckList(String vc_vote_id) {
		return voteDao.voteCheckList(vc_vote_id);
	}

	// 투표시 해당 투표, option count 증가 / 투표기록 남기기 (단일)
	public int comVote(int vo_seq, int vl_seq, String vc_vote_id) {

		int result = 0;

		int optionResult = voteDao.plusOptionCount(vo_seq);
		int voteResult = voteDao.plusVoteCount(vl_seq);
		int voteCheckResult = voteDao.insertVoteCheck(vl_seq, vc_vote_id);

		if (optionResult == 1 && voteResult == 1 && voteCheckResult == 1) {
			result = 1;
		}
		return result;
	}

	// 중복 투표시 해당 투표 option count 증가
	public int icOption(int vo_seq) {
		return voteDao.plusOptionCount(vo_seq);
	}

	// 중복 투표시 해당 투표 vote count 증가 / 기록 남기기
	public int icVoteRecord(int vl_seq, String vc_vote_id) {
		
		int result = 0;
		
		int plusVoteCount = voteDao.plusVoteCount(vl_seq);
		int voteCheck = voteDao.insertVoteCheck(vl_seq, vc_vote_id);
		
		if(plusVoteCount == 1 && voteCheck ==1 ) {
			result = 1;
		}
		
		return result;
	}

	// 중복투표시 기록 남기기
//	public int recordVote(int vl_seq, ) {
//		return 
//	}

}
