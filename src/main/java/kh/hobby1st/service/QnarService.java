package kh.hobby1st.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.hobby1st.dao.QnaReplyDAO;
import kh.hobby1st.dto.ClubBoardReplyDTO;
import kh.hobby1st.dto.QnaReplyDTO;

@Service
public class QnarService {

	@Autowired
	public QnaReplyDAO qnarDao;


	// 게시판 댓글 작성하기
	public int insert(QnaReplyDTO dto) {
		return qnarDao.insert(dto);
	}

	// 해당 게시판 댓글 가져오기
	public List<QnaReplyDTO> selectReply(int qna_seq) {
		return qnarDao.selectReply(qna_seq);
	}


	// 댓글 삭제하기
	public int deleteReply(int reply_seq) {
		return qnarDao.deleteReply(reply_seq);
	}


	// 해당 게시판 댓글 개수
	public int replyCount(int qna_seq) {
		return qnarDao.replyCount(qna_seq);
	}
//
//	// 댓글 count 증가
//	public int plusReply(int qna_seq) {
//		return qnarDao.plusReply(qna_seq);
//	}
//
//	// 댓글 count 감소
//	public int minusReply(int qna_seq) {
//		return qnarDao.minusReply(qna_seq);
//	}
}
