package kh.hobby1st.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.hobby1st.dao.ClubJoinStateDAO;
import kh.hobby1st.dto.ClubJoinStateDTO;

@Service
public class ClubJoinStateService {
	
	@Autowired
	private ClubJoinStateDAO csDao;
	
	
	// 동호회 가입 요청
	public int requestJoin(ClubJoinStateDTO dto){
		return csDao.requestJoin(dto);
	}

}
