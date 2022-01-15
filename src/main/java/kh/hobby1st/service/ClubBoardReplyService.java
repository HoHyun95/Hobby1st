package kh.hobby1st.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.hobby1st.dao.ClubBoardReplyDAO;
import kh.hobby1st.dto.ClubBoardReplyDTO;

@Service
public class ClubBoardReplyService {

	@Autowired
	public ClubBoardReplyDAO cbrDao;

	// 게시판 댓글 작성하기
	public int insert(ClubBoardReplyDTO dto) {
		return cbrDao.insert(dto);
	}

	// 해당 게시판 댓글 가져오기
	public List<ClubBoardReplyDTO> selectReply(int seq) {
		return cbrDao.selectReply(seq);
	}

	// 댓글 삭제하기
	public int deleteReply(int reply_seq) {
		return cbrDao.deleteReply(reply_seq);
	}

	// 해당 게시판 댓글 개수
	public int replyCount(int board_seq) {
		return cbrDao.replyCount(board_seq);
	}

	// 댓글 count 증가
	public int plusReply(int board_seq) {
		return cbrDao.plusReply(board_seq);
	}

	// 댓글 count 감소
	public int minusReply(int board_seq) {
		return cbrDao.minusReply(board_seq);
	}

	
	
}
