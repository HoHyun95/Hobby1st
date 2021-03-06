package kh.hobby1st.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hobby1st.dto.ClubBoardReplyDTO;

@Repository
public class ClubBoardReplyDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 게시판 댓글 작성하기
	public int insert(ClubBoardReplyDTO dto) {
		return mybatis.insert("ClubBoardReply.insertReply", dto);
	}
	
	// 게시판 대댓글 작성하기
	public int insert_rec(ClubBoardReplyDTO dto) {
		return mybatis.insert("ClubBoardReply.insertReply_rec", dto);
	}

	// 해당 게시판 댓글 가져오기
	public List<ClubBoardReplyDTO> selectReply(int board_seq) {
		return mybatis.selectList("ClubBoardReply.selectReply", board_seq);
	}
	
	// 댓글 삭제하기
	public int deleteReply(int reply_seq) {
		return mybatis.delete("ClubBoardReply.deleteReply", reply_seq);
	}
	
	// 대댓글 삭제하기
	public int deleteReply_r(int reply_r_seq) {
		return mybatis.delete("ClubBoardReply.deleteReply_r", reply_r_seq);
	}
	
	// 해당 게시판 댓글 개수
	public int replyCount(int board_seq) {
		return mybatis.selectOne("ClubBoardReply.replyCount", board_seq);
	}
	
	// 댓글 count 증가
	public int plusReply(int board_seq) {
		return mybatis.update("ClubBoardReply.plusReply", board_seq);
	}
	
	// 댓글 count 감소
	public int minusReply(int board_seq) {
		return mybatis.update("ClubBoardReply.minusReply", board_seq);
	}
	
	
	
	
	
	
	
}
