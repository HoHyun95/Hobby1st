package kh.hobby1st.service;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.hobby1st.dao.VoteDAO;
import kh.hobby1st.dto.VoteListDTO;

@Service
public class VoteService {
	
	@Autowired
	private VoteDAO voteDao;
	
	// 투표 리스트에 추가
	public int insertVoteList(VoteListDTO dto,String edateY, String edateM, String edateD) {
		Date edate = Date.valueOf(edateY + "-" + edateM + "-" + edateD);
		dto.setVl_end_date(edate);
		
		return voteDao.insertVoteList(dto);
	}
		
	// 해당 투표 옵션 추가하기
	public int insertVoteOption(String option) {
		return voteDao.insertVoteOption(option);
	}

}
