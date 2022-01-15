package kh.hobby1st.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.hobby1st.dao.ClubList_PhotoDAO;
import kh.hobby1st.dto.ClubList_PhotoDTO;

@Service
public class ClubList_PhotoService {

	@Autowired
	private ClubList_PhotoDAO clpDao;
	
	public int insertPhoto(ClubList_PhotoDTO dto) {
		return clpDao.insertPhoto(dto);
	}
	
	

}
