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
		
	// 해당 게시판 댓글 가져오기
		public List<ClubBoardReplyDTO> selectReply(int seq) {
			return mybatis.selectList("ClubBoardReply.selectReply", seq);
		}
		
		
		
	

}
