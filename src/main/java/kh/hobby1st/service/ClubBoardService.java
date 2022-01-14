package kh.hobby1st.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.hobby1st.dao.ClubBoardDAO;
import kh.hobby1st.dto.ClubBoardDTO;

@Service
public class ClubBoardService {
	
	
	@Autowired
	public ClubBoardDAO cbdao;
	
	public int insert(ClubBoardDTO dto) {
		return cbdao.insert(dto);
	}

}
