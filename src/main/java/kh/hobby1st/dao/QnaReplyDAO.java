package kh.hobby1st.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hobby1st.dto.ClubBoardReplyDTO;
import kh.hobby1st.dto.QnaReplyDTO;

@Repository
public class QnaReplyDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 게시판 댓글 작성하기
	public int insert(QnaReplyDTO dto) {
		return mybatis.insert("QnaReply.insertReply", dto);
	}


	// 해당 게시판 댓글 가져오기
	public List<QnaReplyDTO> selectReply(int qna_seq) {
		return mybatis.selectList("QnaReply.selectReply", qna_seq);
	}

	// 댓글 삭제하기
	public int deleteReply(int reply_seq) {
		return mybatis.delete("QnaReply.deleteReply", reply_seq);
	}


//	// 해당 게시판 댓글 개수
//	public int replyCount(int qna_seq) {
//		return mybatis.selectOne("QnaReply.replyCount", qna_seq);
//	}
//
//	// 댓글 count 증가
//	public int plusReply(int qna_seq) {
//		return mybatis.update("QnaReply.plusReply", qna_seq);
//	}
//
//	// 댓글 count 감소
//	public int minusReply(int qna_seq) {
//		return mybatis.update("QnaReply.minusReply", qna_seq);
//	}
}
