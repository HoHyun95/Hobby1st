package kh.hobby1st.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.hobby1st.dao.ClubListDAO;
import kh.hobby1st.dto.ClubListDTO;

@Service
public class ClubListService {


	@Autowired
	public ClubListDAO cldao; 
	
	public int createClub(ClubListDTO dto) {
		return cldao.createClub(dto);
	}
	
	public int  nameCheck(String cl_name) {
		return cldao.nameCheck(cl_name);
	}
	
	public 	List<Map<String, Object>> selectAll() {
		return cldao.selectAll();
	}
}
