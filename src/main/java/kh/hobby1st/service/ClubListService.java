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

//	동호회 수
	public int countClub() {
		return cldao.countClub();
	}

	public int createClub(ClubListDTO dto) {
		return cldao.createClub(dto);
	}

	public int nameCheck(String cl_name) {
		return cldao.nameCheck(cl_name);
	}

	public List<ClubListDTO> selectAll() {
		return cldao.selectAll();
	}

	// 동호회 리스트 및 검색 결과에서 동호회 명 클릭시 해당 동호회 상세 정보->
	public ClubListDTO selectClub(String cl_id) {
		return cldao.selectClub(cl_id);
	}

	public List<ClubListDTO> searchClub(String searchField, String searchText) {
		String modifiedText = searchText;
		if (searchText.contains(" ")) {
			modifiedText = searchText.trim();
		}
		return cldao.searchClub(searchField, modifiedText);
	}

	// 해당 동호회 가입 여부 확인
	public int checkMember(int cl_seq, String mem_id) {
		return cldao.checkMember(cl_seq, mem_id);
	}

}
