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

}
